import SwiftUI

struct SelectedCommandListView: View {
    @EnvironmentObject var viewModel: SelectedCommandViewModel
    @State private var selectedSection: SelectedCommandSectionEnum = .FromStartToDoubleLoop
    @State private var sectionTopPositions: [SelectedCommandSectionEnum: CGFloat] = [:]

    var body: some View {
        ScrollViewReader { scrollProxy in
            List {
                Section {
                    Rectangle()
                        .frame(height: 0)
                        .id(SelectedCommandSectionEnum.FromStartToDoubleLoop)
                    ForEach($viewModel.fromStartToDoubleLoopCommands) { $motionCommand in
                        SelectedCommandCellView(motionCommand: $motionCommand)
                            .id(motionCommand.id)
                    }
                    .onMove(perform: fromStartToDoubleLoopCommandsRowReplace)
                    Rectangle()
                        .frame(height: 0)
                        .id(SelectedCommandSectionEnum.FromAreaAToAreaB)
                } header: {
                    HStack(spacing: 0) {
                        Text(SelectedCommandSectionEnum.FromStartToDoubleLoop.description)
                            .font(SelectedCommandViewInfo().commandTitleFont)
                            .foregroundStyle(.black)
                        Spacer()
                        Button {
                            print("Tapped Download Button")
                        } label: {
                            Image(systemName: "arrow.down.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.blue)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                        Button {
                            print("Tapped Upload Button")
                        } label: {
                            Image(systemName: "arrow.up.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.red)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                    } // HStack
                } // Section
                .listRowSeparator(.hidden)
                .opacity(viewModel.isSelectedSection == .FromStartToDoubleLoop ? 1.0 : 0.3)

                Section {
                    Rectangle()
                        .frame(height: 0)
                    ForEach($viewModel.fromAreaAToAreaBCommands) { $motionCommand in
                        SelectedCommandCellView(motionCommand: $motionCommand)
                            .id(motionCommand.id)
                    }
                    .onMove(perform: fromAreaAToAreaBCommandsRowReplace)
                    Rectangle()
                        .frame(height: 0)
                        .id(SelectedCommandSectionEnum.AreaB)
                } header: {
                    HStack(spacing: 0) {
                        Text(SelectedCommandSectionEnum.FromAreaAToAreaB.description)
                            .font(SelectedCommandViewInfo().commandTitleFont)
                            .foregroundStyle(.black)
                        Spacer()
                        Button {
                            print("Tapped Download Button")
                        } label: {
                            Image(systemName: "arrow.down.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.blue)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                        Button {
                            print("Tapped Upload Button")
                        } label: {
                            Image(systemName: "arrow.up.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.red)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                    } // HStack
                } // Section
                .listRowSeparator(.hidden)
                .opacity(viewModel.isSelectedSection == .FromAreaAToAreaB ? 1.0 : 0.3)

                Section {
                    Rectangle()
                        .frame(height: 0)
                    ForEach($viewModel.areaBCommands) { $motionCommand in
                        SelectedCommandCellView(motionCommand: $motionCommand)
                            .id(motionCommand.id)
                    }
                    .onMove(perform: areaBCommandsRowReplace)
                    Rectangle()
                        .frame(height: 0)
                        .id(SelectedCommandSectionEnum.AreaABottom)
                } header: {
                    HStack(spacing: 0) {
                        Text(SelectedCommandSectionEnum.AreaB.description)
                            .font(SelectedCommandViewInfo().commandTitleFont)
                            .foregroundStyle(.black)
                        Spacer()
                        Button {
                            print("Tapped Download Button")
                        } label: {
                            Image(systemName: "arrow.down.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.blue)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                        Button {
                            print("Tapped Upload Button")
                        } label: {
                            Image(systemName: "arrow.up.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.red)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                    } // HStack
                } // Section
                .listRowSeparator(.hidden)
                .opacity(viewModel.isSelectedSection == .AreaB ? 1.0 : 0.3)

                Section {
                    Rectangle()
                        .frame(height: 0)
                    ForEach($viewModel.areaABottomCommands) { $motionCommand in
                        SelectedCommandCellView(motionCommand: $motionCommand)
                            .id(motionCommand.id)
                    }
                    .onMove(perform: areaABottomCommandsRowReplace)
                    Rectangle()
                        .frame(height: 0)
                } header: {
                    HStack(spacing: 0) {
                        Text(SelectedCommandSectionEnum.AreaABottom.description)
                            .font(SelectedCommandViewInfo().commandTitleFont)
                            .foregroundStyle(.black)
                        Spacer()
                        Button {
                            print("Tapped Download Button")
                        } label: {
                            Image(systemName: "arrow.down.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.blue)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                        Button {
                            print("Tapped Upload Button")
                        } label: {
                            Image(systemName: "arrow.up.to.line.circle")
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(.red)
                                .padding(.trailing, SelectedCommandViewInfo().padding*4)
                        }
                    } // HStack
                } // Section
                .listRowSeparator(.hidden)
                .opacity(viewModel.isSelectedSection == .AreaABottom ? 1.0 : 0.3)
            } // List
            .listStyle(SidebarListStyle())
            .frame(width: SelectedCommandViewInfo().selectedCommandListWidth + 52)
            .background(SelectedCommandViewInfo().selectedCommandListBackground)
            .environment(\.editMode, .constant(.active))
            .onChange(of: viewModel.newCommandId) { id in
                withAnimation {
                    scrollProxy.scrollTo(id)
                }
            }
            .onChange(of: viewModel.isSelectedSection) { section in
                withAnimation {
                    switch section {
                    case .FromStartToDoubleLoop:
                        scrollProxy.scrollTo(section, anchor: .bottom)
                    case .FromAreaAToAreaB:
                        scrollProxy.scrollTo(section, anchor: .top)
                    case .AreaB:
                        scrollProxy.scrollTo(section, anchor: .top)
                    case .AreaABottom:
                        scrollProxy.scrollTo(section, anchor: .top)
                    case .none:
                        break
                    }
                }
            }
        } // ScrollViewReader
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
