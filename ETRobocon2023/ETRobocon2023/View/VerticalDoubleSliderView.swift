//import SwiftUI
//
//struct VerticalDoubleSliderView: View {
//    @Binding var minValue: Int
//    @Binding var maxValue: Int
//    @Binding var top: CGFloat
//    @Binding var bottom: CGFloat
//    let circleDiameter: CGFloat = 18
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            Rectangle()
//                .fill(.gray.opacity(0.2))
//                .frame(width: 6)
//            Rectangle()
//                .fill(.gray)
//                .frame(width: 6, height: bottom - top)
//                .offset(y: top - circleDiameter)
//            VStack(spacing: 0) {
//                Circle()
//                    .fill(.gray)
//                    .frame(width: circleDiameter, height: circleDiameter)
////                    .offset(y: bottom)
//                    .gesture(DragGesture().onChanged({ value in
//                        <#code#>
//                    }))
//                Circle()
//                    .fill(.gray)
//                    .frame(width: circleDiameter, height: circleDiameter)
////                    .offset(y: top)
//            } // HStack
//        } // ZStack
//    } // var body
//
//    func getValue(val: CGFloat) -> Int {
//        let result = Double(val) * 100
//        return Int(round(result))
//    }
//}
//
//struct VerticalDoubleSliderView_Previews: PreviewProvider {
//    @State static var minValue = 0
//    @State static var maxValue = 200
//    @State static var top: CGFloat = 0
//    @State static var bottom: CGFloat = 500
//    static var previews: some View {
//        VerticalDoubleSliderView(minValue: $minValue,
//                                 maxValue: $maxValue,
//                                 top: $top,
//                                 bottom: $bottom)
//    }
//}
