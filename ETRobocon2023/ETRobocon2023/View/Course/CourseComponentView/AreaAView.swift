import SwiftUI

/// 配置エリアA．
/// 外側の黒い円，内側の黄色の円，中心の点線の円を描画する．
struct AreaAView: View {

    private var centerPoint = CGPoint(x: LCourseSize.centerXOfA, y: LCourseSize.centerYOfA)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AreaAView_Previews: PreviewProvider {
    static var previews: some View {
        AreaAView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
