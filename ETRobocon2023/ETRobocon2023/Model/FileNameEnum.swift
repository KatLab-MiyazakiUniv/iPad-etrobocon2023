import Foundation

enum FileNameEnum {
    case LineTraceLeft
    case LineTraceRight
    case DoubleLoopLeft
    case DoubleLoopRight
    case BlockDeTreasureLeft
    case BlockDeTreasureRight

    var name: String {
        switch self {
        case .LineTraceLeft:
            return "LineTraceLeft.csv"
        case .LineTraceRight:
            return "LineTraceRight.csv"
        case .DoubleLoopLeft:
            return "DoubleLoopLeft"
        case .DoubleLoopRight:
            return "DoubleLoopRight"
        case .BlockDeTreasureLeft:
            return "BlockDeTreasureLeft"
        case .BlockDeTreasureRight:
            return "BlockDeTreasureRight"
        }
    }
}
