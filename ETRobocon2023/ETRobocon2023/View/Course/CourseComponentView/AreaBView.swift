import SwiftUI

/// 配置エリアB．
/// 外側の黒い円，内側の黄色の円，中心の点線の円，青線を描画する．
struct AreaBView: View {

    private var centerPoint = CGPoint(x: LCourseSize.centerXOfB, y: LCourseSize.centerYOfB)
    
    var body: some View {
        ZStack {
            
        } // ZStack
    } // var body
} // AreaBView

struct AreaBView_Previews: PreviewProvider {
    static var previews: some View {
        AreaBView()
            .scaleEffect(LCourseViewSize.previewScale)
    }
}
