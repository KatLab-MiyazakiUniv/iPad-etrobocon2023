import SwiftUI

/// スタート地点(より上部)の青線
struct StartBlueLineView: View {
    // start point
//    private var startX: CGFloat {
//        LCourseViewSize.startX
//    }

//    private var startY: CGFloat {
//        LCourseViewSize.startY
//    }

//    private var startPoint: CGPoint {
//        CGPoint(x: startX, y: startY)
//    }

    // end point
//    private var endX: CGFloat {
//        LCourseViewSize.startX
//    }

//    private var endY: CGFloat {
//        LCourseSize.startBlueLineLength
//    }

//    private var endPoint: CGPoint {
//        CGPoint(x: endX, y: endY)
//    }

    private let path: (inout Path) -> Void = { path in
        var startX: CGFloat {
            LCourseViewSize.startX
        }

        var startY: CGFloat {
            LCourseViewSize.startY
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        var endX: CGFloat {
            LCourseViewSize.startX
        }

        var endY: CGFloat {
            LCourseSize.startBlueLineLength
        }

        var endPoint: CGPoint {
            CGPoint(x: endX, y: endY)
        }

        path.move(to: startPoint)
        path.addLine(to: endPoint)
    }

    var body: some View {
        Path { path in
            self.path(&path)
        }
        .stroke(lineWidth: LCourseSize.lineWidth)
        .fill(.blue)
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct StartBlueLineView

struct StartBlueLineView_Previews: PreviewProvider {
    static var previews: some View {
        StartBlueLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
