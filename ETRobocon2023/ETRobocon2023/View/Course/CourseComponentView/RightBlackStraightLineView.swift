import SwiftUI

/// コース右側の，スタート直後の直進
struct RightBlackStraightLineView: View {
    private let path: (inout Path) -> Void = { path in
        // start point
        var startX: CGFloat {
            LCourseViewSize.startX
        }

        var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
        var endX: CGFloat {
            startX
        }

        var endY: CGFloat {
            startY + LCourseSize.rightBlackStraightLineLength
        }

        var endPoint: CGPoint {
            CGPoint(x: endX, y: endY)
        }

        path.move(to: startPoint)
        path.addLine(to: endPoint)
    }

    func getPath() -> ((inout Path) -> Void) {
        path
    }

    var body: some View {
        Path { path in
            self.path(&path)
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
