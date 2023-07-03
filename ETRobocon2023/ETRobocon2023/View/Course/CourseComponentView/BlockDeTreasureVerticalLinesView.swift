import SwiftUI

/// ブロックdeトレジャーの，垂直の黒線3本の組
struct BlockDeTreasureVerticalLinesView: View {
    let bottomEndPoint: CGPoint

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
