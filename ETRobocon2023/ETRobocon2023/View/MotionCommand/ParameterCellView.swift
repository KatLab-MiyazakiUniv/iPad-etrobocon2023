//
//  ParameterCellView.swift
//  ETRobocon2023
//
//  Created by オナガ・ハルキ on 2023/08/11.
//

import SwiftUI

struct ParameterCellWithTextFieldView: View {
    @Binding var inputText: String
    let parameterTitle: String

    var body: some View {
        VStack(spacing: 0) {
            Text(parameterTitle)
                .font(.system(size: SelectedCommandCellInfo().parameterFontSize, weight: .bold))
                .padding(.bottom, SelectedCommandCellInfo().halfPadding)
                .padding(.top, SelectedCommandCellInfo().padding)
            TextField(parameterTitle, text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: SelectedCommandCellInfo().textFieldWidth)
                .padding(.bottom, SelectedCommandCellInfo().padding)
        }
        .frame(width: SelectedCommandCellInfo().parameterCellWidth)
        .background(SelectedCommandCellInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandCellInfo().cornerRadius)
    }
}

struct ParameterCellWithTextFieldView_Previews: PreviewProvider {
    @State static var inputText = ""
    static var previews: some View {
        ParameterCellWithTextFieldView(inputText: $inputText, parameterTitle: "目標距離(mm)")
            .previewLayout(.fixed(width: 550, height: 400))
            .background(.black)
    }
}
