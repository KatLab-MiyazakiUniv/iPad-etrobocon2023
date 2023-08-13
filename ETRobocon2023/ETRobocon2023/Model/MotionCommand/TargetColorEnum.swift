import SwiftUI

enum TargetColorEnum: CaseIterable {
    case Black
    case White
    case Blue
    case Green
    case Yellow
    case Red

    var colorName: String {
        switch self {
        case .Black: return "BLACK"
        case .White: return "WHITE"
        case .Blue: return "BLUE"
        case .Green: return "GREEN"
        case .Yellow: return "YELLOW"
        case .Red:return "RED"
        }
    }

    var color: Color {
        switch self {
        case .Black: return .black
        case .White: return .white
        case .Blue: return .blue
        case .Green: return .green
        case .Yellow: return .yellow
        case .Red: return .red
        }
    }
}
