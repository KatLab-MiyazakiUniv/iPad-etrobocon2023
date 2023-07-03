import SwiftUI

/// コース左側の直進からダブルループに枝分かれしたカーブ
struct DoubleLoopEntranceBlackLineView: View {
    // start point
    private var startX: CGFloat {
        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
    }

    private var startY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength - LCourseSize.endOfCornerToBranchingLength
    }

    private var startPoint: CGPoint {
        CGPoint(x: startX, y: startY)
    }

    // end point
    private var endX: CGFloat {
        LCourseSize.centerXOfA
    }

    private var endY: CGFloat {
        LCourseSize.centerYOfA - LCourseSize.blackCircleRadiusOfA
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }

    // control point
    private var controlX: CGFloat {
        startX + 90
    }

    private var controlY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength + LCourseSize.blackLineCornerRadius - 1285
    }

    private var controlPoint: CGPoint {
        CGPoint(x: controlX, y: controlY)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DoubleLoopEntranceBlackLineView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleLoopEntranceBlackLineView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
