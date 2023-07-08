import SwiftUI

struct TerminalView: View {
    @StateObject var viewModel = TerminalViewModel()

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                ScrollViewReader { scrollView in
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(viewModel.messages, id: \.self) { message in
                            Text(message)
                                .font(.system(size: 15, weight: .regular, design: .monospaced))
                                .foregroundColor(.white)
                                .padding([.top, .bottom], 2)
                        } // ForEach
                    } // VStack
                } // ScrollViewReader
            } // ScrollView
            .padding(.all, 10)
        } // ZStack
    } // var body
} // TerminalView

struct TerminalView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalView()
    }
}
