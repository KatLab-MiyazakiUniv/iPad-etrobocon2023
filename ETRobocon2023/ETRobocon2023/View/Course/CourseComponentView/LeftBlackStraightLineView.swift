import SwiftUI

/// コース左側の直進
struct LeftBlackStraightLineView: View {
    private let path: (inout Path) -> Void = { path in
        // start point
         var startX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
        }

         var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength
        }

         var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
         var endX: CGFloat {
            startX
        }

         var endY: CGFloat {
            startY - LCourseSize.leftBlackStraightLineLength
        }

         var endPoint: CGPoint {
            CGPoint(x: endX, y: endY)
        }

        path.move(to: startPoint)
        path.addLine(to: endPoint)
    }

    private let beforeDoubleLoopPath: (inout Path) -> Void = { path in
        // start point
        var startX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
        }

        var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
        var endX: CGFloat {
            startX
        }

        var endY: CGFloat {
            LCourseViewSize.startY
            + LCourseSize.startBlueLineLength
            + LCourseSize.rightBlackStraightLineLength
            - LCourseSize.endOfCornerToBranchingLength
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
    
    func getBeforeDoubleLoopPath() -> ((inout Path) -> Void) {
        beforeDoubleLoopPath
    }

    private let areaABottomPath: (inout Path) -> Void = { path in
        // start point
        var startX: CGFloat {
            LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
        }

        var startY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.endOfCornerToBranchingLength - LCourseSize.doubleLoopEntranceBlueLineLength
        }

        var startPoint: CGPoint {
            CGPoint(x: startX, y: startY)
        }

        // end point
        var endX: CGFloat {
            startX
        }

        var endY: CGFloat {
            LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.leftBlackStraightLineLength
        }

        var endPoint: CGPoint {
            CGPoint(x: endX, y: endY)
        }

        path.move(to: startPoint)
        path.addLine(to: endPoint)
    }

    func getAreaABottomPath() -> ((inout Path) -> Void) {
        areaABottomPath
    }

    var body: some View {
        Path { path in
            self.path(&path)
        }
        .stroke(lineWidth: LCourseSize.lineWidth)
        .fill(.black)
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct LeftBlackStraightLineView

struct LeftBlackStraightLineView_Previews: PreviewProvider {
    static var previews: some View {
        LeftBlackStraightLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
