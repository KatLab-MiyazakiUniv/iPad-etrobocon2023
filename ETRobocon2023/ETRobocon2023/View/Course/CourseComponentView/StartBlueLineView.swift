import SwiftUI

/// スタート地点(より上部)の青線
struct StartBlueLineView: View {
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
} // struct StartBlueLineView

struct StartBlueLineView_Previews: PreviewProvider {
    static var previews: some View {
        StartBlueLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
