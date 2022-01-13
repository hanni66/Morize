//
//  LoginView.swift
//  Morize (iOS)
//
//  Created by 김하은 on 2022/01/05.
//

import SwiftUI
// 소셜 로그인 (카카오톡, 네이버, 구글, 애플)
import KakaoSDKUser
import KakaoSDKAuth
import GoogleSignIn
import KakaoSDKCommon

struct LoginView: View {
    @State var member = UserInfo.init()    // 로그인 관련 init 파일
    @EnvironmentObject var googledel: GoogleDelegate
//    @EnvironmentObject var appledel: QuickSignInWithApple
    @EnvironmentObject var kakaodel: AppDelegate   // kakao AppDelegate 함수 공유
    @AppStorage("UserName") var UserName : String = UserDefaults.standard.string(forKey: "UserName") ?? ""
    var body: some View {
        
        Text("Morize")
        Text(UserName)
        // 소셜 로그인 부분
        
        HStack{
            Button(action : {
                kakaodel.kakaocheck()
            }){
                Image("kakaolink_btn_small")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding()
            
            Button(action: {
                googledel.signIn()
            }) {
                Image("btn_google_light_normal_ios")
                    .resizable()
                    .frame(width: 60, height: 60)
            }.padding()
            
            Button(action: {
//                appledel.appleLogin()
            }) {
                Text("애플")
                    .font(.headline)
                    .padding()
            }.padding()
            
            Button {
                UserApi.shared.unlink {(error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("unlink() success.")
                    }
                }
            } label: {
                Text("카카오 로그아웃")
            }

        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(isLoggin: false)
//    }
//}
