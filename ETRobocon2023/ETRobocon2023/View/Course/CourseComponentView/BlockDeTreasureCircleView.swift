import SwiftUI

/// ライントレースの終端とブロックdeトレジャーの小さい円
struct BlockDeTreasureCircleView: View {
    var center: CGPoint
    var color: Color

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct BlockDeTreasureCircleView

struct BlockDeTreasureCircleView_Previews: PreviewProvider {
    static let center = CGPoint(x: 500, y: 500)
    static let color = Color.red
    static var previews: some View {
        BlockDeTreasureCircleView(center: center, color: color)
    }
}
