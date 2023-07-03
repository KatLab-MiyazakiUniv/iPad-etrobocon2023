import SwiftUI

/// ライントレースの終端とブロックdeトレジャーの小さい円
struct BlockDeTreasureCircleView: View {
    var center: CGPoint
    var color: Color

    var body: some View {
        Path { path in
            path.addArc(center: center,
                        radius: LCourseSize.treasureCircleRadius,
                        startAngle: .degrees(0),
                        endAngle: .degrees(0.001),
                        clockwise: true)
        }
        .stroke(lineWidth: LCourseSize.lineWidth)
        .fill(color)
    } // var body
} // struct BlockDeTreasureCircleView

struct BlockDeTreasureCircleView_Previews: PreviewProvider {
    static let center = CGPoint(x: 500, y: 500)
    static let color = Color.red
    static var previews: some View {
        BlockDeTreasureCircleView(center: center, color: color)
    }
}
