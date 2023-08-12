//
//  SelectedCommandListView.swift
//  ETRobocon2023
//
//  Created by オナガ・ハルキ on 2023/08/11.
//

import SwiftUI

struct SelectedCommandListView: View {
    @EnvironmentObject var viewModel: SelectedCommandViewModel
    @State private var selectedSection: SelectedCommandSectionEnum = .FromStartToDoubleLoop
    @State private var sectionTopPositions: [SelectedCommandSectionEnum: CGFloat] = [:]

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            SelectedCommandSectionView(motionCommands: $viewModel.fromStartToDoubleLoopCommands,
                                       sectionTitle: SelectedCommandSectionEnum.FromStartToDoubleLoop.description,
                                       isSelected: viewModel.isSelectedSection == .FromStartToDoubleLoop)
            .padding(.bottom, SelectedCommandViewInfo().padding*3)

            SelectedCommandSectionView(motionCommands: $viewModel.fromAreaAToAreaBCommands,
                                       sectionTitle: SelectedCommandSectionEnum.FromAreaAToAreaB.description,
                                       isSelected: viewModel.isSelectedSection == .FromAreaAToAreaB)
            .padding(.bottom, SelectedCommandViewInfo().padding*3)

            SelectedCommandSectionView(motionCommands: $viewModel.areaBCommands,
                                       sectionTitle: SelectedCommandSectionEnum.AreaB.description,
                                       isSelected: viewModel.isSelectedSection == .AreaB)
            .padding(.bottom, SelectedCommandViewInfo().padding*3)
            
            SelectedCommandSectionView(motionCommands: $viewModel.areaABottomCommands,
                                       sectionTitle: SelectedCommandSectionEnum.AreaABottom.description,
                                       isSelected: viewModel.isSelectedSection == .AreaABottom)
            .padding(.bottom, SelectedCommandViewInfo().padding*3)
        }
        .frame(width: SelectedCommandViewInfo().selectedCommandListWidth)
        .background(SelectedCommandViewInfo().selectedCommandListBackground)
    }
}

struct SelectedCommandListView_Previews: PreviewProvider {
    @State static var viewModel = SelectedCommandViewModel()
    static var previews: some View {
        SelectedCommandListView()
            .previewLayout(.fixed(width: 600, height: 1000))
    }
}
