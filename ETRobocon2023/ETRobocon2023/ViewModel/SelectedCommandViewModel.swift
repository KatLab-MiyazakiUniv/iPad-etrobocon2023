import Foundation

class SelectedCommandViewModel: ObservableObject {
    @Published var isSelectedSection: SelectedCommandSectionEnum? = .FromStartToDoubleLoop
    @Published var courseSide: CourseSideEnum = .LeftCourse
    @Published var fromStartToDoubleLoopCommands: [MotionCommand] = []
    @Published var fromAreaAToAreaBCommands: [MotionCommand] = []
    @Published var areaBCommands: [MotionCommand] = []
    @Published var areaABottomCommands: [MotionCommand] = []

    func addSelectedCommand(_ command: MotionCommandEnum) {
        guard let section = isSelectedSection else { return }
        let motionCommand = MotionCommand(command: command, section: section)
        switch section {
        case .FromStartToDoubleLoop:
            fromStartToDoubleLoopCommands.append(motionCommand)
        case .FromAreaAToAreaB:
            fromAreaAToAreaBCommands.append(motionCommand)
        case .AreaB:
            areaBCommands.append(motionCommand)
        case .AreaABottom:
            areaABottomCommands.append(motionCommand)
        }
    }

    func deleteSelectedCommand(_ command: MotionCommand) {
        switch command.section {
        case .FromStartToDoubleLoop:
            let index = fromStartToDoubleLoopCommands.indexOfCommand(withId: command.id)
            fromStartToDoubleLoopCommands.remove(at: index)
        case .FromAreaAToAreaB:
            let index = fromAreaAToAreaBCommands.indexOfCommand(withId: command.id)
            fromAreaAToAreaBCommands.remove(at: index)
        case .AreaB:
            let index = areaBCommands.indexOfCommand(withId: command.id)
            areaBCommands.remove(at: index)
        case .AreaABottom:
            let index = areaABottomCommands.indexOfCommand(withId: command.id)
            areaABottomCommands.remove(at: index)
        }
    }
}
