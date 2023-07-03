import SwiftUI

/// ブロックdeトレジャーの，水平の黒線3本の組
struct BlockDeTreasureHorizontalLinesView: View {
    let leftEndPoint: CGPoint

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
