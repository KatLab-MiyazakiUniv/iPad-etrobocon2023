import SwiftUI

/// 配置エリアB．
/// 外側の黒い円，内側の黄色の円，中心の点線の円，青線を描画する．
struct AreaBView: View {

    private var centerPoint = CGPoint(x: LCourseSize.centerXOfB, y: LCourseSize.centerYOfB)

    private let areaBBlackPath: (inout Path) -> Void = { path in
        var centerPoint = CGPoint(x: LCourseSize.centerXOfB, y: LCourseSize.centerYOfB)
        path.addArc(center: centerPoint,
                    radius: LCourseSize.blackCircleRadiusOfB,
                    startAngle: .degrees(0),
                    endAngle: .degrees(0.001),
                    clockwise: true)
    }

    func getAreaBBlackPath() -> ((inout Path) -> Void) {
        areaBBlackPath
    }

    private let areaBBluePath: (inout Path) -> Void = { path in
        var centerPoint = CGPoint(x: LCourseSize.centerXOfB, y: LCourseSize.centerYOfB)
        path.addArc(center: centerPoint,
                    radius: LCourseSize.blackCircleRadiusOfB,
                    startAngle: .degrees(222),
                    endAngle: .degrees(184),
                    clockwise: true)
    }

    func getAreaBBluePath() -> ((inout Path) -> Void) {
        areaBBluePath
    }

    private let areaABottomPath: (inout Path) -> Void = { path in
        var centerPoint = CGPoint(x: LCourseSize.centerXOfB, y: LCourseSize.centerYOfB)
        path.addArc(center: centerPoint,
                    radius: LCourseSize.blackCircleRadiusOfB,
                    startAngle: .degrees(170),
                    endAngle: .degrees(184),
                    clockwise: false)
    }

    func getAreaABottomPath() -> ((inout Path) -> Void) {
        areaABottomPath
    }

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

            // 黄色
            Path { path in
                path.addArc(center: centerPoint,
                            radius: LCourseSize.yellowCircleRadiusOfB,
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

            // 青線
            Path { path in
                path.addArc(center: centerPoint,
                            radius: LCourseSize.blackCircleRadiusOfB,
                            startAngle: .degrees(222),
                            endAngle: .degrees(184),
                            clockwise: true)
            }
            .stroke(lineWidth: LCourseSize.lineWidth)
            .fill(.blue)
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
