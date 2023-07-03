import SwiftUI

/// コース左側の，スタート直後の直進
struct LeftBlackStraightLineView: View {
    // start point
    private var startX: CGFloat {
        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius - LCourseSize.bottomBlackStraightLineLength - LCourseSize.blackLineCornerRadius
    }

    private var startY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength
    }

    private var startPoint: CGPoint {
        CGPoint(x: startX, y: startY)
    }

    // end point
    private var endX: CGFloat {
        startX
    }

    private var endY: CGFloat {
        startY - LCourseSize.leftBlackStraightLineLength
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct LeftBlackStraightLineView

struct LeftBlackStraightLineView_Previews: PreviewProvider {
    static var previews: some View {
        LeftBlackStraightLineView()
    }
}
