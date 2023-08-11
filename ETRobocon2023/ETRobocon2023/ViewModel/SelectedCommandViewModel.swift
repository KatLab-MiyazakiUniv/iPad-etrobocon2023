import Foundation

class SelectedCommandViewModel: ObservableObject {
    @Published var isSelectedSection = SelectedCommandSectionEnum.FromStartToDoubleLoop
    @Published var fromStartToDoubleLoopCommands: [any MotionCommand] = []
    @Published var fromAreaAToAreaBCommands: [any MotionCommand] = []
    @Published var areaBCommands: [any MotionCommand] = []
    @Published var areaABottomCommands: [any MotionCommand] = []

    func addSelectedCommand(_ command: any MotionCommand, to: SelectedCommandSectionEnum) {
        switch to {
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

enum SelectedCommandSectionEnum {
    case FromStartToDoubleLoop
    case FromAreaAToAreaB
    case AreaB
    case AreaABottom
}

extension SelectedCommandSectionEnum: CustomStringConvertible {
    var description: String {
        switch self {
        case .FromStartToDoubleLoop:
            "スタートからダブルループ直前まで"
        case .FromAreaAToAreaB:
            "エリアA開始からエリアB直前まで"
        case .AreaB:
            "エリアB開始からエリアB終了まで"
        case .AreaABottom:
            "エリアA下部"
        }
    }
}
