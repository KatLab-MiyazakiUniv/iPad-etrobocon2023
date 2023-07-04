import SwiftUI

/// ダブルループ後，コース下部の水平の直進と合流するカーブ
struct DoubleLoopExitBlackLineView: View {
    private let path: (inout Path) -> Void = { path in
        // start point
        var startX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength + LCourseSize.endOfCornerToBranchingLength
        }

        var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength + LCourseSize.blackLineCornerRadius
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
        var endX: CGFloat {
            LCourseSize.centerXOfA + LCourseSize.blackCircleRadiusOfA
        }

        var endY: CGFloat {
            LCourseSize.centerYOfA + 30
        }

        var endPoint: CGPoint {
            CGPoint(x: endX, y: endY)
        }

        // control point
        var controlX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius + 1200
        }

        var controlY: CGFloat {
            startY + 15
        }

        var controlPoint: CGPoint {
            CGPoint(x: controlX, y: controlY)
        }

        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, control: controlPoint)
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
} // struct DoubleLoopExitBlackLineView

struct DoubleLoopExitBlackLineView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleLoopExitBlackLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
