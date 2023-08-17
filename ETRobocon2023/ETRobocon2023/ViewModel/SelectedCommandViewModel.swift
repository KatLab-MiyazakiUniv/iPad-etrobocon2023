import Foundation

class SelectedCommandViewModel: ObservableObject {
    @Published var isSelectedSection: SelectedCommandSectionEnum? = .FromStartToDoubleLoop
    @Published var courseSide: CourseSideEnum = .LeftCourse
    @Published var fromStartToDoubleLoopCommands: [MotionCommand] = []
    @Published var fromAreaAToAreaBCommands: [MotionCommand] = []
    @Published var areaBCommands: [MotionCommand] = []
    @Published var areaABottomCommands: [MotionCommand] = []

//    func addSelectedCommand(_ command: MotionCommand) {
    func addSelectedCommand(_ command: MotionCommandEnum) {
        guard let section = isSelectedSection else { return }
        let motionCommand = MotionCommand(command: command, section: section)
        switch section {
        case .FromStartToDoubleLoop:
//            command.section = .FromStartToDoubleLoop
            fromStartToDoubleLoopCommands.append(motionCommand)
        case .FromAreaAToAreaB:
//            command.section = .FromAreaAToAreaB
            fromAreaAToAreaBCommands.append(motionCommand)
        case .AreaB:
//            command.section = .AreaB
            areaBCommands.append(motionCommand)
        case .AreaABottom:
//            command.section = .AreaABottom
            areaABottomCommands.append(motionCommand)
        }
    }

    func deleteSelectedCommand(_ command: MotionCommand) {
//        guard let section = isSelectedSection else { return }
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
