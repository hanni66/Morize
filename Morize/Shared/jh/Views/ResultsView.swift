//
//  ResultsView.swift
//  Morize (iOS)
//
//  Created by Jinhee on 2021/12/30.
//

import SwiftUI

struct ResultsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let viewModel: ResultsViewModel
    @State var start = false
    @State var end = false
    
    @ObservedObject var gameViewModel: GameViewModel
    @Binding var counter: Int
    @Binding var countTo: Int
    @Binding var gameover: Bool
    @Binding var isTimer: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Text("Final Score: ")
                    Text(viewModel.finalPercentText)
                }
                .font(.title)
                .padding()
                HStack {
                    Text("Letter Grade: ")
                    Text(viewModel.letterGradeText)
                }
                .padding()
                .font(.title)
                Text(viewModel.correctSelectionText)
                    .font(.system(size: 30))
                Text(viewModel.incorrectSelectionText)
                    .font(.system(size: 30))
                Text("Total time: \(viewModel.totalGameTimeText)")
                Spacer()
                
                HStack {
                    Button("뒤로가기") {
                        end = true
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
                    Button("다시하기") {
                        print("asdf")
                        start = true
                        gameViewModel.reset()
                        print("log: \(gameViewModel.gameIsOver)")
                        counter = 0
                        countTo = 5
                        gameover = false
                        isTimer = true
                    }
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
        }
        .background(.white)
        .navigationBarHidden(true)
    }
}
