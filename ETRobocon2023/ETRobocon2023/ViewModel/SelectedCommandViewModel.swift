import Foundation

class SelectedCommandViewModel: ObservableObject {
    @Published var isSelectedSection: SelectedCommandSectionEnum? = .FromStartToDoubleLoop
    @Published var fromStartToDoubleLoopCommands: [any MotionCommand] = []
    @Published var fromAreaAToAreaBCommands: [any MotionCommand] = []
    @Published var areaBCommands: [any MotionCommand] = []
    @Published var areaABottomCommands: [any MotionCommand] = []

    func addSelectedCommand(_ command: any MotionCommand) {
        guard let section = isSelectedSection else { return }
        switch section {
        case .FromStartToDoubleLoop:
            fromStartToDoubleLoopCommands.append(command)
        case .FromAreaAToAreaB:
            fromAreaAToAreaBCommands.append(command)
        case .AreaB:
            areaBCommands.append(command)
        case .AreaABottom:
            areaABottomCommands.append(command)
        }
    }
}

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
