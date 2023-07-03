import SwiftUI

/// ブロックdeトレジャーの4色の円と格子の組
struct BlockDeTreasureView: View {
    // 左下の青い円の中心
    private var centerXOfBottomLeftCircle: CGFloat {
        LCourseViewSize.startX
        - LCourseSize.blackLineCornerRadius
        - LCourseSize.bottomBlackStraightLineLength
        - LCourseSize.blackLineCornerRadius
        + LCourseSize.distanceBetweenLineTraceEndAndTreasure
    }

    private var centerYOfBottomLeftCircle: CGFloat {
        LCourseViewSize.startY
        + LCourseSize.startBlueLineLength
        + LCourseSize.rightBlackStraightLineLength
        - LCourseSize.leftBlackStraightLineLength
        - LCourseSize.lineHalfWidth
        - LCourseSize.treasureCircleRadius
    }

    private var centerOfBottomLeftBlue: CGPoint {
        CGPoint(x: centerXOfBottomLeftCircle, y: centerYOfBottomLeftCircle)
    }

    // 緑の円のうち，左下のものの中心
    private var centerOfBottomLeftGreen: CGPoint {
        CGPoint(x: centerXOfBottomLeftCircle
                + LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure*2,
                y: centerYOfBottomLeftCircle)
    }

    // 赤の円のうち，左下のものの中心
    private var centerOfBottomLeftRed: CGPoint {
        CGPoint(x: centerXOfBottomLeftCircle,
                y: centerYOfBottomLeftCircle
                - LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure*2)
    }

    // 黄色の円のうち，左下のものの中心
    private var centerOfBottomLeftYellow: CGPoint {
        CGPoint(x: centerXOfBottomLeftCircle
                + LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure*2,
                y: centerYOfBottomLeftCircle
                - LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure*2)
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct BlockDeTreasureView

struct BlockDeTreasureView_Previews: PreviewProvider {
    static var previews: some View {
        BlockDeTreasureView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
