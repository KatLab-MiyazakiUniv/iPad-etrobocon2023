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
        ZStack {
            // 青い円
            BlockDeTreasureFourCirclesView(centerOfBottomLeftCircle: centerOfBottomLeftBlue,
                                           color: .blue)
            
            // 緑の円
            BlockDeTreasureFourCirclesView(centerOfBottomLeftCircle: centerOfBottomLeftGreen,
                                           color: .green)
            
            // 赤の円
            BlockDeTreasureFourCirclesView(centerOfBottomLeftCircle: centerOfBottomLeftRed,
                                           color: .red)
            
            // 黄色の円
            BlockDeTreasureFourCirclesView(centerOfBottomLeftCircle: centerOfBottomLeftYellow,
                                           color: .yellow)
            
            // 水平の黒線
            // 下から上
            ForEach(0..<4) { index in
                BlockDeTreasureHorizontalLinesView(
                    leftEndPoint: CGPoint(x: centerXOfBottomLeftCircle
                                          + LCourseSize.treasureCircleRadius
                                          + LCourseSize.lineHalfWidth,
                                          y: centerYOfBottomLeftCircle
                                          - LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure*CGFloat(index)))
            }
            
            // 垂直の黒線
            // 左から右
            ForEach(0..<4) { index in
                BlockDeTreasureVerticalLinesView(
                    bottomEndPoint: CGPoint(x: centerXOfBottomLeftCircle
                                            + LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure*CGFloat(index),
                                            y: centerYOfBottomLeftCircle
                                            - LCourseSize.treasureCircleRadius
                                            - LCourseSize.lineHalfWidth))
            }
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct BlockDeTreasureView

struct BlockDeTreasureView_Previews: PreviewProvider {
    static var previews: some View {
        BlockDeTreasureView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
