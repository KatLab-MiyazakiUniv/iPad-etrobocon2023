//
//  SelectSectionListView.swift
//  ETRobocon2023
//
//  Created by オナガ・ハルキ on 2023/08/11.
//

import SwiftUI

struct SelectSectionListView: View {
//    @State private var selectionValue: SelectedCommandSectionEnum? = nil
    @EnvironmentObject private var viewModel: SelectedCommandViewModel
    var body: some View {
        List(SelectedCommandSectionEnum.allCases, id: \.self, selection: $viewModel.isSelectedSection) { section in
            Text(section.description)
                .font(SelectedCommandViewInfo().commandTitleFont)
        }
        .environment(\.editMode, .constant(.active))
        .frame(width: 500)
    }
}

struct SelectSectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSectionListView()
            .previewLayout(.fixed(width: 600, height: 300))
    }
}
