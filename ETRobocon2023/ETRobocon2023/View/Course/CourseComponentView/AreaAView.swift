import SwiftUI

/// 配置エリアA．
/// 外側の黒い円，内側の黄色の円，中心の点線の円を描画する．
struct AreaAView: View {

    private var centerPoint = CGPoint(x: LCourseSize.centerXOfA, y: LCourseSize.centerYOfA)

    var body: some View {
        ZStack {
            // 黒線
            Path { path in
                path.addArc(center: centerPoint,
                            radius: LCourseSize.blackCircleRadiusOfA,
                            startAngle: .degrees(0),
                            endAngle: .degrees(0.001),
                            clockwise: true)
            }
            .stroke(lineWidth: LCourseSize.lineWidth)
            .fill(.black)

            // 黄色
            Path { path in
                path.addArc(center: centerPoint,
                            radius: LCourseSize.yellowCircleRadiusOfA,
                            startAngle: .degrees(0),
                            endAngle: .degrees(0.001),
                            clockwise: true)
            }
            .fill(.yellow)

            // 点線
            Path { path in
                path.addArc(center: centerPoint,
                            radius: LCourseSize.blueDottedCircleRadius,
                            startAngle: .degrees(0),
                            endAngle: .degrees(0.001),
                            clockwise: true)
            }
            .stroke(style: StrokeStyle(lineWidth: LCourseSize.blueDottedCircleLineWidth,
                                       dash: [LCourseSize.blueDottedCircleSpacing]))
            .fill(.blue)
        } // ZStack
        .frame(width: LCourseViewSize.frameWidth, height: LCourseViewSize.frameHeight)
    } // var body
} // AreaAView

struct AreaAView_Previews: PreviewProvider {
    static var previews: some View {
        AreaAView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
