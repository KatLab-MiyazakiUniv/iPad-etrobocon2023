import SwiftUI

/// コース左下の，黒線のカーブ
struct LeftBottomBlackCornerView: View {
    //    // start point
    //    private var startX: CGFloat {
    //        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength
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
    //        startX - LCourseSize.blackLineCornerRadius
    //    }
    //
    //    private var endY: CGFloat {
    //        startY - LCourseSize.blackLineCornerRadius
    //    }
    //
    //    private var endPoint: CGPoint {
    //        CGPoint(x: endX, y: endY)
    //    }
    //
    //    // control point
    //    private var controlX: CGFloat {
    //        endX
    //    }
    //
    //    private var controlY: CGFloat {
    //        startY
    //    }
    //
    //    private var controlPoint: CGPoint {
    //        CGPoint(x: controlX, y: controlY)
    //    }

    private let path: (inout Path) -> Void = { path in
        // start point
        var startX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength
        }

        var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength + LCourseSize.blackLineCornerRadius
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
        var endX: CGFloat {
            startX - LCourseSize.blackLineCornerRadius
        }

        var endY: CGFloat {
            startY - LCourseSize.blackLineCornerRadius
        }

        var endPoint: CGPoint {
            CGPoint(x: endX, y: endY)
        }

        // control point
        var controlX: CGFloat {
            endX
        }

        var controlY: CGFloat {
            startY
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
} // struct LeftBottomBlackCornerView

struct LeftBottomBlackCornerView_Previews: PreviewProvider {
    static var previews: some View {
        LeftBottomBlackCornerView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
