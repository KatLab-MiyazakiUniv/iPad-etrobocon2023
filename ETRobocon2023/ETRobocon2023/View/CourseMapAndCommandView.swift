import SwiftUI

struct CourseMapAndCommandView: View {
    @EnvironmentObject private var viewModel: SelectedCommandViewModel
    @State private var isAnimating = true

    // 点滅する区間
    @State private var selection = SelectedCommandSectionEnum.FromStartToDoubleLoop

    var body: some View {
        HStack(spacing: 0) {
            MotionCommandOptionList()
//            ListToSelectOneSection()
            SelectedCommandListView()
            VStack {
                CourseView(isAnimating: $isAnimating, segment: $selection)
                    .scaleEffect(0.2)
                    .frame(width: 500,height: 730)
                .background(.white)

                SelectSectionListView()
            }
        } // HStack
//        .background(.black)
    }
}

struct CourseMapAndCommandView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMapAndCommandView()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
