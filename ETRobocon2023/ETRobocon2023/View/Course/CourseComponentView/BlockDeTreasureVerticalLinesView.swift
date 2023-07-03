import SwiftUI

/// ブロックdeトレジャーの，垂直の黒線3本の組
struct BlockDeTreasureVerticalLinesView: View {
    let bottomEndPoint: CGPoint

    // 下側の線分の上端
    private var topEndPointYOfBottomLine: CGFloat {
        bottomEndPoint.y - LCourseSize.blockDeTreasureBlackLineLength
    }

    private var topEndPointOfBottomLine: CGPoint {
        CGPoint(x: bottomEndPoint.x, y: topEndPointYOfBottomLine)
    }

    // 中央の線分の下端
    private var bottomEndPointYOfCenterLine: CGFloat {
        topEndPointYOfBottomLine - LCourseSize.treasureCircleMaximumDiameter
    }

    private var bottomEndPointOfCenterLine: CGPoint {
        CGPoint(x: bottomEndPoint.x, y: bottomEndPointYOfCenterLine)
    }

    // 中央の線分の上端
    private var topEndPointYOfCenterLine: CGFloat {
        bottomEndPointYOfCenterLine - LCourseSize.blockDeTreasureBlackLineLength
    }

    private var topEndPointOfCenterLine: CGPoint {
        CGPoint(x: bottomEndPoint.x, y: topEndPointYOfCenterLine)
    }

    // 上側の線分の下端
    private var bottomEndPointYOfTopLine: CGFloat {
        topEndPointYOfCenterLine - LCourseSize.treasureCircleMaximumDiameter
    }

    private var bottomEndPointOfTopLine: CGPoint {
        CGPoint(x: bottomEndPoint.x, y: bottomEndPointYOfTopLine)
    }

    // 上側の線分の上端
    private var topEndPointYOfTopLine: CGFloat {
        bottomEndPointYOfTopLine - LCourseSize.blockDeTreasureBlackLineLength
    }

    private var topEndPointOfTopLine: CGPoint {
        CGPoint(x: bottomEndPoint.x, y: topEndPointYOfTopLine)
    }

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct BlockDeTreasureVerticalLinesView

struct BlockDeTreasureVerticalLinesView_Previews: PreviewProvider {
    static let bottomEndPoint = CGPoint(x: 1000, y: 1000)
    static var previews: some View {
        BlockDeTreasureVerticalLinesView(bottomEndPoint: bottomEndPoint)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
