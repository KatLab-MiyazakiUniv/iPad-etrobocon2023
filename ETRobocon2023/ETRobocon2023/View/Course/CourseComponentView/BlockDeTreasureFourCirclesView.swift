import SwiftUI

/// ブロックdeトレジャーの，同じ色の4つの円の組
struct BlockDeTreasureFourCirclesView: View {
    let centerOfBottomLeftCircle: CGPoint
    let color: Color

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    } // var body
} // struct BlockDeTreasureFourCirclesView

struct BlockDeTreasureFourCirclesView_Previews: PreviewProvider {
    static let center = CGPoint(x: 500, y: 500)
    static let color = Color.blue
    static var previews: some View {
        BlockDeTreasureFourCirclesView(centerOfBottomLeftCircle: center, color: color)
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
