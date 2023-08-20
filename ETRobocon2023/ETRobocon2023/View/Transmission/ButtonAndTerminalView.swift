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
                        let commandsString = selectedCommandViewModel.commandsToCsv()
                        print(commandsString)
                        terminalViewModel.addMessage(commandsString)
                        Task {
                            let result = await fileSendViewModel.sendCsvFile(with: commandsString,
                                                                             courseSide: selectedCommandViewModel.courseSide,
                                                                             section: selectedCommandViewModel.isSelectedSection!)
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
                } // HStack
            } // GeometryReader
        } // HStack
    } // var body
} // ButtonAndTerminalView

struct ButtonAndTerminalView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAndTerminalView()
            .environmentObject(SelectedCommandViewModel())
            .previewLayout(.fixed(width: 2732/2, height: 2048/2))
    }
}
