import SwiftUI

struct SelectedCommandListView: View {
    @EnvironmentObject var viewModel: SelectedCommandViewModel
    @State private var selectedSection: SelectedCommandSectionEnum = .FromStartToDoubleLoop
    @State private var sectionTopPositions: [SelectedCommandSectionEnum: CGFloat] = [:]

    var body: some View {
        List {
            Section {
                Rectangle()
                    .frame(height: 0)
                ForEach($viewModel.fromStartToDoubleLoopCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .onMove(perform: fromStartToDoubleLoopCommandsRowReplace)
                Rectangle()
                    .frame(height: 0)
            } header: {
                Text(SelectedCommandSectionEnum.FromStartToDoubleLoop.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .listRowSeparator(.hidden)
            .opacity(viewModel.isSelectedSection == .FromStartToDoubleLoop ? 1.0 : 0.3)

            Section {
                Rectangle()
                    .frame(height: 0)
                ForEach($viewModel.fromAreaAToAreaBCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .onMove(perform: fromAreaAToAreaBCommandsRowReplace)
                Rectangle()
                    .frame(height: 0)
            } header: {
                Text(SelectedCommandSectionEnum.FromAreaAToAreaB.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .listRowSeparator(.hidden)
            .opacity(viewModel.isSelectedSection == .FromAreaAToAreaB ? 1.0 : 0.3)

            Section {
                Rectangle()
                    .frame(height: 0)
                ForEach($viewModel.areaBCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .onMove(perform: areaBCommandsRowReplace)
                Rectangle()
                    .frame(height: 0)
            } header: {
                Text(SelectedCommandSectionEnum.AreaB.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .listRowSeparator(.hidden)
            .opacity(viewModel.isSelectedSection == .AreaB ? 1.0 : 0.3)

            Section {
                Rectangle()
                    .frame(height: 0)
                ForEach($viewModel.areaABottomCommands) { $motionCommand in
                    SelectedCommandCellView(motionCommand: $motionCommand)
                }
                .onMove(perform: areaABottomCommandsRowReplace)
                Rectangle()
                    .frame(height: 0)
            } header: {
                Text(SelectedCommandSectionEnum.AreaABottom.description)
                    .font(SelectedCommandViewInfo().commandTitleFont)
                    .foregroundStyle(.black)
            }
            .listRowSeparator(.hidden)
            .opacity(viewModel.isSelectedSection == .AreaABottom ? 1.0 : 0.3)
        } // List
        .listStyle(SidebarListStyle())
        .frame(width: SelectedCommandViewInfo().selectedCommandListWidth + 52)
        .background(SelectedCommandViewInfo().selectedCommandListBackground)
        .environment(\.editMode, .constant(.active))
    } // var body

    func fromStartToDoubleLoopCommandsRowReplace(_ from: IndexSet, _ to: Int) {
        viewModel.fromStartToDoubleLoopCommands.move(fromOffsets: from, toOffset: to)
    }

    func fromAreaAToAreaBCommandsRowReplace(_ from: IndexSet, _ to: Int) {
        viewModel.fromAreaAToAreaBCommands.move(fromOffsets: from, toOffset: to)
    }

    func areaBCommandsRowReplace(_ from: IndexSet, _ to: Int) {
        viewModel.areaBCommands.move(fromOffsets: from, toOffset: to)
    }

    func areaABottomCommandsRowReplace(_ from: IndexSet, _ to: Int) {
        viewModel.areaABottomCommands.move(fromOffsets: from, toOffset: to)
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
