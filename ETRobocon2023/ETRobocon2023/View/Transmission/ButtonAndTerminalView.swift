import SwiftUI

/// 送信ボタンと結果を表示するターミナルを横並びで表示する
struct ButtonAndTerminalView: View {
    @EnvironmentObject private var selectedCommandViewModel: SelectedCommandViewModel
    @ObservedObject var terminalViewModel = TerminalViewModel()
    let fileSendViewModel = FileSendViewModel()

    var body: some View {
        HStack {
            GeometryReader { geometry in
                HStack {
                    TerminalView(messages: $terminalViewModel.messages, width: geometry.size.width/2)
                        .frame(width: geometry.size.width/2, height: geometry.size.height)
                    
                    Button {
//                        terminalViewModel.addMessage("Send sample CSV file to First machine.")
//                        terminalViewModel.addMessage(CsvFileManager.generateSampleFile())
//                        Task {
//                            let result = await fileSendViewModel.SendSampleFile()
//                            terminalViewModel.addMessage("\n" + result + "\n")
//                        }
                        let commandsString = selectedCommandViewModel.commandsToCsv()
                        print(commandsString)
                        terminalViewModel.addMessage(commandsString)
                        Task {
                            let result = await fileSendViewModel.sendCsvFile(commandsString)
                            terminalViewModel.addMessage("\n" + result + "\n")
                        }
                    } label: {
                        Text("Send sample CSV to First machine")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .frame(width: 600, height: 100)
                            .background(.cyan)
                            .cornerRadius(20)
                    }
                    .frame(width: geometry.size.width/2)
                }
            } // GeometryReader
        } // HStack
    } // var body

    /// TerminalViewのデバッグ用
    /// ランダムな文字列を返す
    private func generateRandomString(_ length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        for _ in 0 ..< length {
            randomString += String(letters.randomElement()!)
        }
        return randomString
    }
} // ButtonAndTerminalView

struct ButtonAndTerminalView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAndTerminalView()
            .environmentObject(SelectedCommandViewModel())
            .previewLayout(.fixed(width: 2732/2, height: 2048/2))
    }
}
