import SwiftUI

struct CourseMapAndCommandView: View {
    @EnvironmentObject private var viewModel: SelectedCommandViewModel

    var body: some View {
        HStack(spacing: 0) {
            MotionCommandOptionList()
            SelectedCommandListView()

            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Spacer()
                    Picker("コース", selection: $viewModel.courseSide) {
                        ForEach(CourseSideEnum.allCases, id: \.self) { side in
                            Text(side.sideString)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                    .backgroundStyle(SelectedCommandViewInfo().selectedCommandListBackground)
                    CourseView()
                        .scaleEffect(0.18)
                        .frame(width: 440,height: 640)
                        .backgroundStyle(SelectedCommandViewInfo().selectedCommandListBackground)
                } // VStack
                .background(SelectedCommandViewInfo().selectedCommandListBackground)
                .padding(.bottom, 0)

                SelectSectionListView()
                    .frame(width: 440)
                    .padding(.top, 0)
            } // VStack
            .background(SelectedCommandViewInfo().selectedCommandListBackground)
        } // HStack
        .frame(maxWidth: .infinity)
        .background(SelectedCommandViewInfo().selectedCommandListBackground)
    } // var body
}

struct CourseMapAndCommandView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMapAndCommandView()
            .environmentObject(SelectedCommandViewModel())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
