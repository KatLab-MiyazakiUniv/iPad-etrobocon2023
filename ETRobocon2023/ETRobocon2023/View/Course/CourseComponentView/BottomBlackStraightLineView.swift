import SwiftUI

/// コース下部の，水平の直進
struct BottomBlackStraightLineView: View {
//    // start point
//    private var startX: CGFloat {
//        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius
//    }
//
//    private var startY: CGFloat {
//        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength + LCourseSize.blackLineCornerRadius
//    }
//
//    private var startPoint: CGPoint {
//        CGPoint(x: startX, y: startY)
//    }
//
//    // end point
//    private var endX: CGFloat {
//        startX - LCourseSize.bottomBlackStraightLineLength
//    }
//
//    private var endY: CGFloat {
//        startY
//    }
//
//    private var endPoint: CGPoint {
//        CGPoint(x: endX, y: endY)
//    }

    private let path: (inout Path) -> Void = { path in
        // start point
        var startX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius
        }

        var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength + LCourseSize.blackLineCornerRadius
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
        var endX: CGFloat {
            startX - LCourseSize.bottomBlackStraightLineLength
        }

        var endY: CGFloat {
            startY
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
} // struct BottomBlackStraightLineView

struct BottomBlackStraightLineView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBlackStraightLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
