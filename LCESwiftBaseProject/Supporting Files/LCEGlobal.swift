//
//  LCEGlobal.swift
//  LCEBarnSwallow
//
//  Created by 妖狐小子 on 2018/8/28.
//  Copyright © 2018年 yaohuxiaozi. All rights reserved.
//

import UIKit

extension UIDevice {
    public func isiPhoneXSerie() -> Bool {
        var isMore:Bool = false
        if #available(iOS 11.0, *) {
            if #available(iOS 13.0, *) {
                isMore = UIApplication.shared.windows[0].safeAreaInsets.bottom > 0.0
            }else {
                isMore = (UIApplication.shared.keyWindow?.safeAreaInsets.bottom)! > 0.0
            }
        }
        return isMore
    }
}

// 当前系统版本
public let LCE_SYSTEM_VERSION: String = UIDevice.current.systemVersion

// App版本
public let LCE_APP_VERSION: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String


// 设备屏幕大小
public let LCE_SCREEN_BOUNDS: CGRect = UIScreen.main.bounds
// 设备屏幕宽度
public let LCE_SCREEN_WIDTH: CGFloat = LCE_SCREEN_BOUNDS.size.width
// 设备屏幕高度
public let LCE_SCREEN_HEIGHT: CGFloat = LCE_SCREEN_BOUNDS.size.height

// 适配iPhoneX
public let LCE_ISIPHONEX = UIDevice.current.isiPhoneXSerie()

// 状态栏高度
public let LCE_StatusBar_H: CGFloat = (LCE_ISIPHONEX ? 44: 20)
// 不包括状态栏的导航高度
public let LCE_UnStatusNav_H: CGFloat = 44
// 设备导航高度
public let LCE_NAV_HEIGHT: CGFloat = (LCE_StatusBar_H + LCE_UnStatusNav_H)

// TabBar高度
public let LCE_TAB_HEIGHT: CGFloat = (LCE_ISIPHONEX ? 83: 49)
// 底部view高度
public let LCE_BOTTOM_HEIGHT: CGFloat = (LCE_ISIPHONEX ? 60: 45)
// TabBar顶部间隔
public let LCE_TAB_BUTTONTOPMARGIN: CGFloat = (LCE_ISIPHONEX ? 8 : 0)
// TabBar图片文字间隔
public let LCE_TAB_TITLEMARGIN: CGFloat = (LCE_ISIPHONEX ? 32: 26)


/// iPhone 6
public func LCEScreenPixwn(_ px: CGFloat) -> CGFloat {
    return (LCE_SCREEN_WIDTH / 375.0) * px;
}

// iPhone 5
public func LCEScreenPixw(_ px: CGFloat) -> CGFloat {
    return (LCE_SCREEN_WIDTH / 320.0) * px;
}

