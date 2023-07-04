import Foundation

/// 区間のリスト．
/// 区間を選択していない場合は.NONE．
enum SegmentNames:String, CaseIterable {
    case NONE
    case StartBlueLineView
    case RightBlackStraightLineView
    case RightBottomBlackCornerView
    case BottomBlackStraightLineView
    case LeftBottomBlackCornerView
    case LeftBlackStraightLineView
    case DoubleLoopEntranceBlackLineView
    case AreaAView
    case AreaBView
    case DoubleLoopExitBlackLineView
    case DoubleLoopEntranceBlueStraightLineView
    case DoubleLoopEntranceBlueCurveLineView
    case BlockDeTreasureCircleView
    case LineTraceEndCircleView
    case BlockDeTreasureView
} // enum SegmentNames
