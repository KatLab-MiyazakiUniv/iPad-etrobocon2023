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

            VStack(spacing: 0) {
                Spacer()
                Picker("コース", selection: $viewModel.courseSide) {
                    ForEach(CourseSideEnum.allCases, id: \.self) { side in
                        Text(side.sideString)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
//                .foregroundStyle(.pink)

                CourseView(isAnimating: $isAnimating, segment: $selection)
                    .scaleEffect(0.2)
                    .frame(width: 500,height: 700)
                    .backgroundStyle(.white)
                    .cornerRadius(SelectedCommandViewInfo().cornerRadius)
//                    .background(.red)

                SelectSectionListView()
            }
//            .backgroundStyle(.green)
        } // HStack
//        .backgroundStyle(.black)
    }
}

struct CourseMapAndCommandView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMapAndCommandView()
            .environmentObject(SelectedCommandViewModel())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
