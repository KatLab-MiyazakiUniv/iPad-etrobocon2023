import SwiftUI

/// コース右下の，黒線のカーブ
struct RightBottomBlackCornerView: View {
    // start point
    private var startX: CGFloat {
        LCourseViewSize.startX
    }

    private var startY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength
    }

    private var startPoint: CGPoint {
        CGPoint(x: startX, y: startY)
    }

    // end point
    private var endX: CGFloat {
        startX - LCourseSize.blackLineCornerRadius
    }

    private var endY: CGFloat {
        startY + LCourseSize.blackLineCornerRadius
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }

    // control point
    private var controlX: CGFloat {
        startX
    }

    private var controlY: CGFloat {
        endY
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
} // struct RightBottomBlackCornerView

struct RightBottomBlackCornerView_Previews: PreviewProvider {
    static var previews: some View {
        RightBottomBlackCornerView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
