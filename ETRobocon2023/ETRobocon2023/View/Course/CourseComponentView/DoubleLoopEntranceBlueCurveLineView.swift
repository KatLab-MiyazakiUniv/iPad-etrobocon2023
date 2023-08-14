import SwiftUI

/// ダブルループ入りのカーブの青線
struct DoubleLoopEntranceBlueCurveLineView: View {
//    // start point
//    private var startX: CGFloat {
//        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
//    }
//
//    private var startY: CGFloat {
//        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.endOfCornerToBranchingLength
//    }
//
//    private var startPoint: CGPoint {
//        CGPoint(x: startX, y: startY)
//    }
//
//    // end point
//    private var endX: CGFloat {
//        49
//    }
//
//    private var endY: CGFloat {
//        startY - LCourseSize.doubleLoopEntranceBlueLineLength + 4
//    }
//
//    private var endPoint: CGPoint {
//        CGPoint(x: endX, y: endY)
//    }
//
//    // control point
//    private var controlX: CGFloat {
//        19
//    }
//
//    private var controlY: CGFloat {
//        startY - 155
//    }
//
//    private var controlPoint: CGPoint {
//        CGPoint(x: controlX, y: controlY)
//    }

    private let path: (inout Path) -> Void = { path in
        // start point
        var startX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
        }

        var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.endOfCornerToBranchingLength
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
        var endX: CGFloat {
            49
        }

        var endY: CGFloat {
            startY - LCourseSize.doubleLoopEntranceBlueLineLength + 4
        }

        var endPoint: CGPoint {
            CGPoint(x: endX, y: endY)
        }

        // control point
        var controlX: CGFloat {
            19
        }

        var controlY: CGFloat {
            startY - 155
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
        .fill(.blue)
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct DoubleLoopEntranceBlueCurveLineView

struct DoubleLoopEntranceBlueCurveLineView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleLoopEntranceBlueCurveLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
