import Foundation

enum SelectedCommandSectionEnum: CaseIterable {
    case FromStartToDoubleLoop
    case FromAreaAToAreaB
    case AreaB
    case AreaABottom
}

extension SelectedCommandSectionEnum: CustomStringConvertible {
    var description: String {
        switch self {
        case .FromStartToDoubleLoop:
            return "スタートからダブルループ直前まで"
        case .FromAreaAToAreaB:
            return "エリアA開始からエリアB直前まで"
        case .AreaB:
            return "エリアB開始からエリアB終了まで"
        case .AreaABottom:
            return "エリアA下部"
        }
    }
}
