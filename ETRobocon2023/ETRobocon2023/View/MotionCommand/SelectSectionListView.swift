import SwiftUI

struct SelectSectionListView: View {
    @EnvironmentObject private var viewModel: SelectedCommandViewModel
    var body: some View {
        List(SelectedCommandSectionEnum.allCases, id: \.self, selection: $viewModel.isSelectedSection) { section in
            Text(section.description)
                .font(SelectedCommandViewInfo().commandTitleFont)
        }
        .environment(\.editMode, .constant(.active))
        .frame(width: 440)
    }
}

struct SelectSectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSectionListView()
            .environmentObject(SelectedCommandViewModel())
            .previewLayout(.fixed(width: 600, height: 300))
    }
}
