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
            SelectedCommandSectionView(sectionTitle: SelectedCommandSectionEnum.FromStartToDoubleLoop.description, isSelected: selectedSection == .FromStartToDoubleLoop, onUpdate: { offset in
                sectionTopPositions[.FromStartToDoubleLoop] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(sectionTitle: SelectedCommandSectionEnum.FromAreaAToAreaB.description, isSelected: selectedSection == .FromAreaAToAreaB, onUpdate: { offset in
                sectionTopPositions[.FromAreaAToAreaB] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(sectionTitle: SelectedCommandSectionEnum.AreaB.description, isSelected: selectedSection == .AreaB, onUpdate: { offset in
                sectionTopPositions[.AreaB] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(sectionTitle: SelectedCommandSectionEnum.AreaABottom.description, isSelected: selectedSection == .AreaABottom, onUpdate: { offset in
                sectionTopPositions[.AreaABottom] = offset
                updateSelectedSection()
            })
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            Color.clear.frame(height: dummyViewHeight)
        }
        .frame(width: SelectedCommandViewInfo().selectedCommandListWidth)
        .background(SelectedCommandViewInfo().selectedCommandListBackground)
    }

    func updateSelectedSection() {
        if let closestSection = sectionTopPositions.sorted(by: { abs($0.value) < abs($1.value) }).first?.key {
            selectedSection = closestSection
        }
    }
}

struct SelectedCommandListView_Previews: PreviewProvider {
    @State static var viewModel = SelectedCommandViewModel()
    static var previews: some View {
        SelectedCommandListView()
            .previewLayout(.fixed(width: 600, height: 1000))
    }
}
