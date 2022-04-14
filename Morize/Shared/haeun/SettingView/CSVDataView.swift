//
//  CSVDataView.swift
//  Morize
//
//  Created by 김하은 on 2022/01/24.
//

import SwiftUI
import UniformTypeIdentifiers

// CSV 파일로 가져오기 / 내보내기
struct CSVDataView: View {
    @State private var document: TextFile = TextFile(message: "Hello, World!")
    @State private var isImporting: Bool = false
    @State private var isExporting: Bool = false
    @Environment(\.presentationMode) var presentationmode
    
    var body: some View {
        VStack(alignment: .leading) {
            //            GroupBox(label: Text("Message:")) {
            //                TextEditor(text: $document.message)
            //            }
            
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
                
                Text("CSV 백업 및 복원")
                    .font(.custom("NotoSansKR-Bold", size: 25))
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .padding(EdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 0))
                
                LabelledDivider(label: "CSV 파일 가져오기 / 내보내기", image: "megaphone")
                
                Button(action: { isImporting = true }, label: {
                    HStack{
                        Text("CSV 파일로 단어 가져오기")
                            .font(.custom("NotoSansKR-Regular", size: 16))
                            .foregroundColor(Color.init(hex: "666666"))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.init(hex: "666666"))
                    }.padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                }).fileImporter(
                    isPresented: $isImporting,
                    allowedContentTypes: [.plainText],
                    allowsMultipleSelection: false
                ) { result in
                    do {
                        guard let selectedFile: URL = try result.get().first else { return }
                        guard let message = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                        
                        document.message = message
                    } catch {
                        // Handle failure.
                    }
                }
                
                Button(action: { isExporting = true }, label: {
                    HStack{
                        Text("CSV파일로 단어 내보내기")
                            .font(.custom("NotoSansKR-Regular", size: 16))
                            .foregroundColor(Color.init(hex: "666666"))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.init(hex: "666666"))
                    }.padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                }).fileExporter(
                    isPresented: $isExporting,
                    document: document,
                    contentType: .plainText,
                    defaultFilename: "Message"
                ) { result in
                    if case .success = result {
                        // Handle success.
                    } else {
                        // Handle failure.
                    }
                }
                    
//                    List{
                    //                Text("도움말")
                    //                Section(header: Text("가져오는 방법")){
                    //                    Text("dddddd")
                    //                }
                    //                Section(header: Text("내보내는 방법")){
                    //                    Text("dddddd")
                    //                }
                    //            }.listStyle(SidebarListStyle())
                    //                List{
                    //                    Text("도움말")
                    //                    Section(header: Text("가져오는 방법")){
                    //                        Text("dddddd")
                    //                    }
                    //                    Section(header: Text("내보내는 방법")){
                    //                        Text("dddddd")
                    //                    }
                    //                }.listStyle(SidebarListStyle())
            }
            .navigationBarHidden(true)
        }
    }
}

struct TextFile: FileDocument {
    // 시스템에 일반 텍스트만 지원함.
    static var readableContentTypes = [UTType.plainText]
    
    // 기본적으로 문서는 비어있음.
    var message: String
    
    // 초기화 과정 비어있는 새 문서를 생성.
    init(message: String) {
        self.message = message
    }
    
    // 이전에 저장된 데이터를 가져옴.
    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let stringg = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        message = stringg
    }
    
    // 데이터를 사용할 때 호출 됨.
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        return FileWrapper(regularFileWithContents: message.data(using: .utf8)!)
    }
}

struct CSVDataView_Previews: PreviewProvider {
    static var previews: some View {
        CSVDataView()
    }
}
