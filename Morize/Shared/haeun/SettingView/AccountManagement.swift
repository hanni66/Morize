//
//  AccountManagement.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI

// 계정관리

struct AccountManagement: View {
    @AppStorage("UserName") var UserName : String = UserDefaults.standard.string(forKey: "UserName") ?? "사용자"
    @AppStorage("isLogin") var isLogin : Bool = UserDefaults.standard.bool(forKey: "isLogin")
    
    @EnvironmentObject var googledel: GoogleDelegate
    @EnvironmentObject var kakaodel: AppDelegate   // kakao AppDelegate 함수 공유
    @Environment(\.presentationMode) var presentationmode
    
    @StateObject var userAuth: GoogleDelegate = GoogleDelegate()
    @StateObject var kakaoAuth: AppDelegate = AppDelegate()
    
    var body: some View {
        VStack(alignment: .leading){
            Button {
                print("뒤로가기 버튼")
                self.presentationmode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.backward")
            }
            .foregroundColor(Color.init(hex: "008E00"))
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
            
            Spacer()
            
            ScrollView() {
                Text("계정관리")
                    .font(.custom("NotoSansKR-Bold", size: 25))
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 0))
                
                LabelledDivider(label: "\(UserName)의 정보", image: "person.circle")
                
                
                // 로그아웃 클릭할 때 한번에 되는지 확인 필요
                Button(action : {
                    //로그인 정보가 들어있는 값에 따라서 카카오, 구글, 애플중에 고르기
                    if (LoginView.googleLogin == 1){
                        // google 로그아웃
                        googledel.signOut()
                        isLogin = false
                    } else if (LoginView.kakaoLogin == 1){
                        // kakao 로그아웃
                        kakaodel.kakaosignout()
                        isLogin = false
                    }
                }){
                    HStack{
                        Text("로그아웃")
                            .font(.custom("NotoSansKR-Regular", size: 16))
                            .foregroundColor(Color.init(hex: "666666"))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.init(hex: "666666"))
                    }
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                }
                
                Button(action : {
                    
                }){
                    HStack{
                        Text("개인정보처리방침")
                            .font(.custom("NotoSansKR-Regular", size: 16))
                            .foregroundColor(Color.init(hex: "666666"))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.init(hex: "666666"))
                    }
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                }
            }
            
            // 회원탈퇴가 필요할 지 상의 필요
        }
        .navigationBarHidden(true)
    }
}
struct AccountManagement_Previews: PreviewProvider {
    static var previews: some View {
        AccountManagement()
    }
}
