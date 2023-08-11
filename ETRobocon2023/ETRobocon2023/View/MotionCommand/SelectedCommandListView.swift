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
    let dummyViewHeight: CGFloat = UIScreen.main.bounds.height*2/3

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            SelectedCommandSectionView(motionCommands: $viewModel.fromStartToDoubleLoopCommands, sectionTitle: SelectedCommandSectionEnum.FromStartToDoubleLoop.description, isSelected: viewModel.isSelectedSection == .FromStartToDoubleLoop, onUpdate: { offset in
                sectionTopPositions[.FromStartToDoubleLoop] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(motionCommands: $viewModel.fromAreaAToAreaBCommands, sectionTitle: SelectedCommandSectionEnum.FromAreaAToAreaB.description, isSelected: viewModel.isSelectedSection == .FromAreaAToAreaB, onUpdate: { offset in
                sectionTopPositions[.FromAreaAToAreaB] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(motionCommands: $viewModel.areaBCommands, sectionTitle: SelectedCommandSectionEnum.AreaB.description, isSelected: viewModel.isSelectedSection == .AreaB, onUpdate: { offset in
                sectionTopPositions[.AreaB] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(motionCommands: $viewModel.areaABottomCommands, sectionTitle: SelectedCommandSectionEnum.AreaABottom.description, isSelected: viewModel.isSelectedSection == .AreaABottom, onUpdate: { offset in
                sectionTopPositions[.AreaABottom] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
//            Color.clear.frame(height: dummyViewHeight)
        }
        .frame(width: SelectedCommandViewInfo().selectedCommandListWidth)
        .background(SelectedCommandViewInfo().selectedCommandListBackground)
    }

    func updateSelectedSection() {
//        if let closestSection = sectionTopPositions.sorted(by: { abs($0.value) < abs($1.value) }).first?.key {
//            selectedSection = closestSection
//        }
    }
}

struct SelectedCommandListView_Previews: PreviewProvider {
    @State static var viewModel = SelectedCommandViewModel()
    static var previews: some View {
        SelectedCommandListView()
            .previewLayout(.fixed(width: 600, height: 1000))
    }
}
