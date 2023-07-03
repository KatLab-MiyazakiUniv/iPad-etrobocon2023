import SwiftUI

/// 配置エリアB．
/// 外側の黒い円，内側の黄色の円，中心の点線の円，青線を描画する．
struct AreaBView: View {

    private var centerPoint = CGPoint(x: LCourseSize.centerXOfB, y: LCourseSize.centerYOfB)

    var body: some View {
        ZStack {
            // 黒線
            Path { path in
                path.addArc(center: centerPoint,
                            radius: LCourseSize.blackCircleRadiusOfB,
                            startAngle: .degrees(0),
                            endAngle: .degrees(0.001),
                            clockwise: true)
            }
            .stroke(lineWidth: LCourseSize.lineWidth)
            .fill(.black)
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // AreaBView

struct AreaBView_Previews: PreviewProvider {
    static var previews: some View {
        AreaBView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
