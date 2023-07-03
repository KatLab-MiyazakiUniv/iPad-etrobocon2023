import SwiftUI

/// コース右側の，スタート直後の直進
struct RightBlackStraightLineView: View {
    // start point
    private var startX: CGFloat {
        LCourseViewSize.startX
    }

    private var startY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength
    }

    private var startPoint: CGPoint {
        CGPoint(x: startX, y: startY)
    }

    // end point
    private var endX: CGFloat {
        startX
    }

    private var endY: CGFloat {
        startY + LCourseSize.rightBlackStraightLineLength
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }

    var body: some View {
        Path { path in
            path.move(to: startPoint)
            path.addLine(to: endPoint)
        }
        .stroke(lineWidth: LCourseSize.lineWidth)
        .fill(.black)
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct RightBlackStraightLineView

struct RightBlackStraightLineView_Previews: PreviewProvider {
    static var previews: some View {
        RightBlackStraightLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
