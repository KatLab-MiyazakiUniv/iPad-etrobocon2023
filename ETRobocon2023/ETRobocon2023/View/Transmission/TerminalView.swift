import SwiftUI

/// 文字列をターミナル風に表示する
struct TerminalView: View {
    @Binding var messages: [String]
    var width: CGFloat

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            ScrollViewReader { scrollProxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        // idに配列のインデックスを指定することで重複したメッセージに対応する
                        ForEach(Array(messages.enumerated()), id: \.offset) { index, message in
                            Text(message)
                                .font(.system(size: 15, weight: .regular, design: .monospaced))
                                .foregroundColor(.white)
                                .padding([.top, .bottom], 2)
                                .padding([.leading], 5)
                                .id(index)
                        } // ForEach
                    } // VStack
                    .frame(width: width, alignment: .leading)
                    .onChange(of: messages) { _ in
                        scrollProxy.scrollTo(messages.count - 1)
                    }
                } // ScrollView
            } // ScrollViewReader
        } // ZStack
    } // var body
} // TerminalView

struct TerminalView_Previews: PreviewProvider {
    @ObservedObject static var viewModel = TerminalViewModel()
    static let width: CGFloat = 800
    static var previews: some View {
        TerminalView(messages: $viewModel.messages, width: width)
    }
}
