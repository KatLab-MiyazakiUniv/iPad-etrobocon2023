import SwiftUI

/// ブロックdeトレジャーの，水平の黒線3本の組
struct BlockDeTreasureHorizontalLinesView: View {
    let leftEndPoint: CGPoint

    // 左側の線分の右端
    private var rightEndPointXOfLeftLine: CGFloat {
        leftEndPoint.x + LCourseSize.blockDeTreasureBlackLineLength
    }

    private var rightEndPointOfLeftLine: CGPoint {
        CGPoint(x: rightEndPointXOfLeftLine, y: leftEndPoint.y)
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
        leftEndPointXOfCenterLine + LCourseSize.blockDeTreasureBlackLineLength
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
        leftEndPointXOfRightLine + LCourseSize.blockDeTreasureBlackLineLength
    }

    private var rightEndPointOfRightLine: CGPoint {
        CGPoint(x: rightEndPointXOfRightLine, y: leftEndPoint.y)
    }

    var body: some View {
        // 左から右
        Path { path in
            // 左側の線分
            path.move(to: leftEndPoint)
            path.addLine(to: rightEndPointOfLeftLine)

            // 中央の線分
            path.move(to: leftEndPointOfCenterLine)
            path.addLine(to: rightEndPointOfCenterLine)

            // 右側の線分
            path.move(to: leftEndPointOfRightLine)
            path.addLine(to: rightEndPointOfRightLine)
        }
        .stroke(lineWidth: LCourseSize.lineWidth)
        .fill(.black)
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // struct BlockDeTreasureHorizontalLinesView

struct BlockDeTreasureHorizontalLinesView_Previews: PreviewProvider {
    static let leftMostPoint = CGPoint(x: 500, y: 500)
    static var previews: some View {
        BlockDeTreasureHorizontalLinesView(leftEndPoint: leftMostPoint)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
