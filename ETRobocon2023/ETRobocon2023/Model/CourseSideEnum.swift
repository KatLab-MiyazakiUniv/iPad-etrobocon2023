import Foundation

enum CourseSideEnum: CaseIterable {
    case LeftCourse
    case RightCourse

    var string: String {
        switch self {
        case .LeftCourse:
            return "Left"
        case .RightCourse:
            return "Right"
        }
    }

//    var fileName: String {
//        switch self {
//        case .LeftCourse:
//            return "LineTraceLeft.csv"
//        case .RightCourse:
//            return "LineTraceRight.csv"
//        }
//    }
}
