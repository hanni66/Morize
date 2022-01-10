//
//  Appdelegate.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/06.
//

import SwiftUI

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


class AppDelegate: NSObject, UIApplicationDelegate{
    
    // 초기화 과정
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        KakaoSDK.initSDK(appKey: "67ccb1551072d256d2a37ebef4b61bfd")
        
        return true
    }
    // 로그인시 url열기 위해 필요함
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
        return false
    }
    
}
