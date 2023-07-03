import SwiftUI

/// コース左側の直進からダブルループに枝分かれしたカーブ
struct DoubleLoopEntranceBlackLineView: View {
    // start point
    private var startX: CGFloat {
        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
    }

    private var startY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.endOfCornerToBranchingLength
    }

    private var startPoint: CGPoint {
        CGPoint(x: startX, y: startY)
    }

    // end point
    private var endX: CGFloat {
        LCourseSize.centerXOfA
    }

    private var endY: CGFloat {
        LCourseSize.centerYOfA - LCourseSize.blackCircleRadiusOfA
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }

    // control point
    private var controlX: CGFloat {
        startX + 90
    }

    private var controlY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength + LCourseSize.blackLineCornerRadius - 1285
    }

    private var controlPoint: CGPoint {
        CGPoint(x: controlX, y: controlY)
    }

    var body: some View {
        Path { path in
            path.move(to: startPoint)
            path.addQuadCurve(to: endPoint, control: controlPoint)
        }
        .stroke(lineWidth: LCourseSize.lineWidth)
        .fill(.black)
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct DoubleLoopEntranceBlackLineView

struct DoubleLoopEntranceBlackLineView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleLoopEntranceBlackLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
