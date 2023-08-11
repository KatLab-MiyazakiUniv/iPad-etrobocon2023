//
//  SelectedCommandListView.swift
//  ETRobocon2023
//
//  Created by オナガ・ハルキ on 2023/08/11.
//

import SwiftUI

struct SelectedCommandListView: View {
    var body: some View {
        ScrollView {
            SelectedCommandSectionView(sectionTitle: "スタートからダブルループ直前まで")
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(sectionTitle: "エリアBに入るまで")
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(sectionTitle: "エリアB最後まで")
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
            SelectedCommandSectionView(sectionTitle: "エリアA最後まで")
                .padding(.bottom, SelectedCommandViewInfo().padding*3)
        }
        .frame(width: SelectedCommandViewInfo().selectedCommandListWidth)
        .background(SelectedCommandViewInfo().selectedCommandListBackground)
    }
}

struct SelectedCommandListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCommandListView()
            .previewLayout(.fixed(width: 600, height: 1000))
    }
}
