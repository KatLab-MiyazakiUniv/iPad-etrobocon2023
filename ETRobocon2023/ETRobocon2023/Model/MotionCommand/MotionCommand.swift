import Foundation

protocol MotionCommand: Identifiable {
    var command: MotionCommandEnum { get }
    var processingDetail: String { get }
}

extension MotionCommand {
    var id: UUID {
        UUID()
    }
}
