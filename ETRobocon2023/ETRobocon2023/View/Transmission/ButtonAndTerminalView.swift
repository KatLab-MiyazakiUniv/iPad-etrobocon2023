import SwiftUI

struct ButtonAndTerminalView: View {
    @ObservedObject var viewModel = TerminalViewModel()

    var body: some View {
        HStack {
            GeometryReader { geometry in
                HStack {
                    TerminalView(messages: $viewModel.messages)
                        .frame(width: geometry.size.width/2, height: geometry.size.height)
                    
                    Button {
                        viewModel.addMessage(generateRandomString(20))
                    } label: {
                        Text("viewModel.addMessage(generateRandomString(20))")
                    }
                    .frame(width: geometry.size.width/2)
                }
            } // GeometryReader
        } // HStack
    } // var body

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
    }
}
