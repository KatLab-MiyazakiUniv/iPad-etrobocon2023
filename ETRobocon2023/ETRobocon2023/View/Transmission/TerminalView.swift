import SwiftUI

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
                        ForEach(messages, id: \.self) { message in
                            Text(message)
                                .font(.system(size: 15, weight: .regular, design: .monospaced))
                                .foregroundColor(.white)
                                .padding([.top, .bottom], 2)
                                .padding([.leading], 5)
//                                .frame(width: width)
//                                .background(.pink)
                                .id(message)
                        } // ForEach
                    } // VStack
                    .frame(width: width, alignment: .leading)
//                    .frame(alignment: .leading)
//                    .background(.green)
                    .onChange(of: messages) { _ in
                        scrollProxy.scrollTo(messages.last)
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
