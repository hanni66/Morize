//
//  DeveloperInfoView.swift
//  Morize
//
//  Created by 김하은 on 2022/04/10.
//

import SwiftUI

struct DeveloperInfoView: View {
    @Environment(\.presentationMode) var presentationmode
    @State private var mailData = ComposeMailData(subject: "Morize 개발자에게",
                                                  recipients: ["haeunkim0807@naver.com"],
                                                  attachments: [AttachmentData(data: "Some text".data(using: .utf8)!,
                                                  mimeType: "text/plain",
                                                  fileName: "text.txt")])
    @State private var showMailView = false
    
    var body: some View {
        VStack(alignment: .leading) {
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
                Text("DeveloperInfo")
                    .font(.custom("NotoSansKR-Bold", size: 25))
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 0))
                
                LabelledDivider(label: "계정", image: "person")
                VStack{
                    DeveloperBottom(ImageName: "haeun", bottomName: "Haeun", gitlink: "https://github.com/hanni66")
                    DeveloperBottom(ImageName: "jinhee", bottomName: "Jinhee", gitlink: "https://github.com/parkjinhee53")
                    DeveloperBottom(ImageName: "profile", bottomName: "Dongseok", gitlink: "https://github.com/MojitoBar")
                }
                .padding(.leading, 20)

                LabelledDivider(label: "지원", image: "megaphone")
                
                Button(action: {
                    showMailView = true
                    print("sendEmail success")
                }) {
                    HStack {
                        Text("개발자에게 메일 보내기")
                            .font(.custom("NotoSansKR-Regular", size: 16))
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.black)
                    }
                    .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                }
                .disabled(!SendEmail.canSendMail)
                .sheet(isPresented: $showMailView) {
                    SendEmail(maildata: $mailData) { result in
                        print(result)
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct DeveloperBottom : View {
    var ImageName : String
    var bottomName : String
    var gitlink : String
    
    var body : some View {
        HStack{
            CircleImageBtn(image: Image(ImageName))
            Spacer()
            Text(bottomName)
            Spacer()
            Link(destination: URL(string: gitlink)!){
                Text("Git")
                    .frame(width: 50, height: 30)
                    .background(Color.init(hex: "008E00"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
                
        }
    }
}

struct CircleImageBtn : View {
    var image: Image
    var imgHW: CGFloat = 50
    
    var body: some View {
        image
            .resizable()
            .frame(width: imgHW, height: imgHW)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.init(hex: "008E00"), lineWidth: 1))
            .shadow(radius: 2)
    }
    
    
}
struct DeveloperInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperInfoView()
    }
}
