//
//  Minigame2Intro.swift
//  Morize (iOS)
//
//  Created by judongseok on 2022/04/15.
//
import Foundation
import SwiftUI

struct Minigame2Intro: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var start = false
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("단어 맞추기")
                .foregroundColor(Color.init(hex: "008E00"))
                .font(.custom("NotoSansKR-Bold", size: 40))
                .padding(.bottom, 30)
                .padding(.leading, 16)
            
            Text("뜻을 보고 15초 안에 스펠링을 순서대로 맞추는 게임입니다.")
                .font(.custom("NotoSansKR-Regular", size: 16))
                .padding(.bottom, 1)
                .padding(.leading, 16)
                .foregroundColor(.black)
            Text("5개 문제를 모두 풀면 클리어 :)")
                .font(.custom("NotoSansKR-Regular", size: 18))
                .padding(.leading, 16)
                .foregroundColor(.black)
            Spacer()
            
            HStack {
                Button("뒤로가기") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .font(.custom("NotoSansKR-Bold", size: 20))
                .padding()
                .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                .background(Color.init(hex: "666666"))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 50)
                .padding(.leading, 16)
                Spacer()
                Button("시작하기") {
                    print("asdf")
                    start = true
                }
                .fullScreenCover(isPresented: $start, content: MiniGame2B.init)
                .font(.custom("NotoSansKR-Bold", size: 20))
                .padding()
                .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 50)
                .background(Color.init(hex: "008E00"))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom, 50)
                .padding(.trailing, 16)
            }
        }
        .navigationBarHidden(true)
    }
}
