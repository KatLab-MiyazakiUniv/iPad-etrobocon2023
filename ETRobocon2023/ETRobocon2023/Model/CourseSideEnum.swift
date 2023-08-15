import Foundation

enum CourseSideEnum: CaseIterable {
    case LeftCourse
    case RightCourse

    var sideString: String {
        switch self {
        case .LeftCourse:
            return "Left"
        case .RightCourse:
            return "Right"
        }
    }
}
