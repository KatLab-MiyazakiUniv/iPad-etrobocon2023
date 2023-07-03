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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
