import SwiftUI

/// ブロックdeトレジャーの，水平の黒線3本の組
struct BlockDeTreasureHorizontalLinesView: View {
    let leftEndPoint: CGPoint

    // 左側の線分の右端
    private var rightEndPointXOfLeftLine: CGFloat {
        leftEndPoint.x + LCourseSize.blockDeTreasureBlackLineLength
    }

    // 中央の線分の左端
    private var leftEndPointXOfCenterLine: CGFloat {
        rightEndPointXOfLeftLine + LCourseSize.treasureCircleMaximumDiameter
    }

    private var leftEndPointOfCenterLine: CGPoint {
        CGPoint(x: leftEndPointXOfCenterLine, y: leftEndPoint.y)
    }

    // 中央の線分の右端
    private var rightEndPointXOfCenterLine: CGFloat {
        leftEndPointXOfCenterLine + LCourseSize.treasureCircleMaximumDiameter
    }

    private var rightEndPointOfCenterLine: CGPoint {
        CGPoint(x: rightEndPointXOfCenterLine, y: leftEndPoint.y)
    }

    // 右側の線分の左端
    private var leftEndPointXOfRightLine: CGFloat {
        rightEndPointXOfCenterLine + LCourseSize.treasureCircleMaximumDiameter
    }

    private var leftEndPointOfRightLine: CGPoint {
        CGPoint(x: leftEndPointXOfRightLine, y: leftEndPoint.y)
    }

    // 右側の線分の右端
    private var rightEndPointXOfRightLine: CGFloat {
        leftEndPointXOfRightLine + LCourseSize.treasureCircleMaximumDiameter
    }

    private var rightEndPointOfRightLine: CGPoint {
        CGPoint(x: rightEndPointXOfRightLine, y: leftEndPoint.y)
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct BlockDeTreasureHorizontalLinesView

struct BlockDeTreasureHorizontalLinesView_Previews: PreviewProvider {
    static let leftMostPoint = CGPoint(x: 500, y: 500)
    static var previews: some View {
        BlockDeTreasureHorizontalLinesView(leftEndPoint: leftMostPoint)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
