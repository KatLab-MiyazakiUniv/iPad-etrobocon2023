import Foundation

@MainActor
class TerminalViewModel: ObservableObject {
    @Published var messages: [String] = []

    func addMessage(_ message: String) {
        self.messages.append(message)
    }
}
