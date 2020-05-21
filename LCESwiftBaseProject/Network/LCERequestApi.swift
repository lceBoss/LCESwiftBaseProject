//
//  LCERequestApi.swift
//  LCESwiftBaseProject
//
//  Created by mac on 2020/5/20.
//  Copyright © 2020 yaohuxiaozi. All rights reserved.
//

import Moya
import HandyJSON

// HUD
let LoadingPlugin = NetworkActivityPlugin { (type, target) in
    switch type {
    case .began:
        LCEProgressHUD.dismiss()
        LCEProgressHUD.show()
    case .ended:
        LCEProgressHUD.dismiss()
    }
}

// 超时
let timeoutClosure = {(endpoint: Endpoint, closure: MoyaProvider<LCERequestApi>.RequestResultClosure) -> Void in
    
    if var urlRequest = try? endpoint.urlRequest() {
        urlRequest.timeoutInterval = 15
        closure(.success(urlRequest))
    } else {
        closure(.failure(MoyaError.requestMapping(endpoint.url)))
    }
}

let ApiProvider = MoyaProvider<LCERequestApi>(requestClosure: timeoutClosure)
let ApiLoadingProvider = MoyaProvider<LCERequestApi>(requestClosure: timeoutClosure, plugins: [LoadingPlugin])

enum LCERequestApi {
    //相关搜索
    case searchRelative(inputText: String)
}

extension LCERequestApi: TargetType {
    
    // baseURL
    var baseURL: URL { return URL(string: "http://app.u17.com/v3/appV3_3/ios/phone")! }
    // 接口地址
    var path: String {
        switch self {
            case .searchRelative: return "search/relative"
        
        }
    }
    
    var method: Moya.Method { return .post }
    
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .searchRelative(let inputText):
            parmeters["inputText"] = inputText
        default:
            break
        }
        
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? { return nil }
}

extension Response {
    func mapModel<T: HandyJSON>(_ type: T.Type) throws -> T {
        let jsonString = String(data: data, encoding: .utf8)
        guard let model = JSONDeserializer<T>.deserializeFrom(json: jsonString) else {
            throw MoyaError.jsonMapping(self)
        }
        return model
    }
}

extension MoyaProvider {
    @discardableResult
    open func request<T: HandyJSON>(_ target: Target,
                                    model: T.Type,
                                    completion: ((_ returnData: T?) -> Void)?) -> Cancellable? {
        
        return request(target, completion: { (result) in
            guard let completion = completion else { return }
            guard let returnData = try? result.value?.mapModel(LCEResponseData<T>.self) else {
                completion(nil)
                return
            }
            completion(returnData.data?.returnData)
        })
    }
}
