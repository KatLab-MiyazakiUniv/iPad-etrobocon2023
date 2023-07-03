import SwiftUI

/// コース下部の，水平の直進
struct BottomBlackStraightLineView: View {
    // start point
    private var startX: CGFloat {
        LCourseViewSize.startX - LCourseSize.blackLineCornerRadius
    }

    private var startY: CGFloat {
        LCourseViewSize.startY + LCourseSize.startBlueLineLength + LCourseSize.rightBlackStraightLineLength + LCourseSize.blackLineCornerRadius
    }

    private var startPoint: CGPoint {
        CGPoint(x: startX, y: startY)
    }

    // end point
    private var endX: CGFloat {
        startX - LCourseSize.bottomBlackStraightLineLength
    }

    private var endY: CGFloat {
        startY
    }

    private var endPoint: CGPoint {
        CGPoint(x: endX, y: endY)
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct BottomBlackStraightLineView

struct BottomBlackStraightLineView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBlackStraightLineView()
    }
}
