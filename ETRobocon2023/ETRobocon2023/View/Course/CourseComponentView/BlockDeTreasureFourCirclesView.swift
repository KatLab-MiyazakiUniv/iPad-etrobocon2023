import SwiftUI

/// ブロックdeトレジャーの，同じ色の4つの円の組
struct BlockDeTreasureFourCirclesView: View {
    let centerOfBottomLeftCircle: CGPoint
    let color: Color

    // 右下の中心
    private var bottomRightCenterX: CGFloat {
        centerOfBottomLeftCircle.x + LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure
    }

    private var bottomRightCenterY: CGFloat {
        centerOfBottomLeftCircle.y
    }

    private var bottomRightCenterPoint: CGPoint {
        CGPoint(x: bottomRightCenterX, y: bottomRightCenterY)
    }

    // 左上の中心
    private var topLeftCenterX: CGFloat {
        centerOfBottomLeftCircle.x
    }

    private var topLeftCenterY: CGFloat {
        centerOfBottomLeftCircle.y - LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure
    }

    private var topLeftCenterPoint: CGPoint {
        CGPoint(x: topLeftCenterX, y: topLeftCenterY)
    }

    // 右上の中心
    private var topRightCenterX: CGFloat {
        centerOfBottomLeftCircle.x + LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure
    }

    private var topRightCenterY: CGFloat {
        centerOfBottomLeftCircle.y - LCourseSize.distanceBetweenCenterOfCirclesInBlockDeTreasure
    }

    private var topRightCenterPoint: CGPoint {
        CGPoint(x: topRightCenterX, y: topRightCenterY)
    }

    var body: some View {
        ZStack {
            // 左下
            BlockDeTreasureCircleView(center: centerOfBottomLeftCircle, color: color)

            // 右下
            BlockDeTreasureCircleView(center: bottomRightCenterPoint, color: color)

            // 左上
            BlockDeTreasureCircleView(center: topLeftCenterPoint, color: color)

            // 右上
            BlockDeTreasureCircleView(center: topRightCenterPoint, color: color)
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct BlockDeTreasureFourCirclesView

struct BlockDeTreasureFourCirclesView_Previews: PreviewProvider {
    static let center = CGPoint(x: 500, y: 500)
    static let color = Color.blue
    static var previews: some View {
        BlockDeTreasureFourCirclesView(centerOfBottomLeftCircle: center, color: color)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
