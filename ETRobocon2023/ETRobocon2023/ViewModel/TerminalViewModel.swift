import Foundation

/// TerminalViewに表示する文字列の保持と更新を行う
@MainActor
class TerminalViewModel: ObservableObject {
    @Published var messages: [String] = []

    func addMessage(_ message: String) {
        self.messages.append(message)
    }
}
