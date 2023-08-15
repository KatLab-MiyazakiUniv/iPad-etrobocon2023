import Foundation

class SelectedCommandViewModel: ObservableObject {
    @Published var isSelectedSection: SelectedCommandSectionEnum? = .FromStartToDoubleLoop
    @Published var courseSide: CourseSideEnum = .LeftCourse
    @Published var fromStartToDoubleLoopCommands: [MotionCommand] = []
    @Published var fromAreaAToAreaBCommands: [MotionCommand] = []
    @Published var areaBCommands: [MotionCommand] = []
    @Published var areaABottomCommands: [MotionCommand] = []

    func addSelectedCommand(_ command: MotionCommand) {
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
