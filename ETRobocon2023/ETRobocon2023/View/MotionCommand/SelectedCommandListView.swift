import SwiftUI

struct SelectedCommandListView: View {
    @EnvironmentObject var viewModel: SelectedCommandViewModel
    @State private var selectedSection: SelectedCommandSectionEnum = .FromStartToDoubleLoop
    @State private var sectionTopPositions: [SelectedCommandSectionEnum: CGFloat] = [:]

    var body: some View {
//        ScrollView(.vertical, showsIndicators: true) {
//            SelectedCommandSectionView(motionCommands: $viewModel.fromStartToDoubleLoopCommands,
//                                       sectionTitle: SelectedCommandSectionEnum.FromStartToDoubleLoop.description,
//                                       isSelected: viewModel.isSelectedSection == .FromStartToDoubleLoop)
//            .padding(.bottom, SelectedCommandViewInfo().padding*3)
//
//            SelectedCommandSectionView(motionCommands: $viewModel.fromAreaAToAreaBCommands,
//                                       sectionTitle: SelectedCommandSectionEnum.FromAreaAToAreaB.description,
//                                       isSelected: viewModel.isSelectedSection == .FromAreaAToAreaB)
//            .padding(.bottom, SelectedCommandViewInfo().padding*3)
//
//            SelectedCommandSectionView(motionCommands: $viewModel.areaBCommands,
//                                       sectionTitle: SelectedCommandSectionEnum.AreaB.description,
//                                       isSelected: viewModel.isSelectedSection == .AreaB)
//            .padding(.bottom, SelectedCommandViewInfo().padding*3)
//            
//            SelectedCommandSectionView(motionCommands: $viewModel.areaABottomCommands,
//                                       sectionTitle: SelectedCommandSectionEnum.AreaABottom.description,
//                                       isSelected: viewModel.isSelectedSection == .AreaABottom)
//            .padding(.bottom, SelectedCommandViewInfo().padding*3)
//        }
//        .frame(width: SelectedCommandViewInfo().selectedCommandListWidth)
//        .background(SelectedCommandViewInfo().selectedCommandListBackground)

        List {
            Section {
                ForEach($viewModel.fromStartToDoubleLoopCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .listRowSeparator(.hidden)
            } header: {
                Text(SelectedCommandSectionEnum.FromStartToDoubleLoop.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .opacity(viewModel.isSelectedSection == .FromStartToDoubleLoop ? 1.0 : 0.3)

            Section {
                ForEach($viewModel.fromAreaAToAreaBCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .listRowSeparator(.hidden)
            } header: {
                Text(SelectedCommandSectionEnum.FromAreaAToAreaB.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .opacity(viewModel.isSelectedSection == .FromAreaAToAreaB ? 1.0 : 0.3)

            Section {
                ForEach($viewModel.areaBCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .listRowSeparator(.hidden)
            } header: {
                Text(SelectedCommandSectionEnum.AreaB.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .opacity(viewModel.isSelectedSection == .AreaB ? 1.0 : 0.3)

            Section {
                ForEach($viewModel.areaABottomCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .listRowSeparator(.hidden)
            } header: {
                Text(SelectedCommandSectionEnum.AreaABottom.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .opacity(viewModel.isSelectedSection == .AreaABottom ? 1.0 : 0.3)
        }
        .listStyle(SidebarListStyle())
        .frame(width: SelectedCommandViewInfo().selectedCommandListWidth)
        .background(SelectedCommandViewInfo().selectedCommandListBackground)
    }
}

struct SelectedCommandListView_Previews: PreviewProvider {
    @State static var viewModel = SelectedCommandViewModel()
    static var previews: some View {
        SelectedCommandListView()
            .environmentObject(SelectedCommandViewModel())
            .previewLayout(.fixed(width: 600, height: 1000))
    }
}
