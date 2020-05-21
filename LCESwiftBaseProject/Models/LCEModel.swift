//
//  LCEModel.swift
//  LCESwiftBaseProject
//
//  Created by mac on 2020/5/20.
//  Copyright © 2020 yaohuxiaozi. All rights reserved.
//

import HandyJSON

extension Array: HandyJSON{}

struct LCEReturnData<T: HandyJSON>: HandyJSON {
    var message:String?
    var returnData: T?
    var stateCode: Int = 0
}

struct LCEResponseData<T: HandyJSON>: HandyJSON {
    var code: Int = 0
    var data: LCEReturnData<T>?
}
