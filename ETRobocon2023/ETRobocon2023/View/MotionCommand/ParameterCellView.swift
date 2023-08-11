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
                .font(.system(size: SelectedCommandCellSize().parameterFontSize, weight: .bold))
                .padding(.bottom, SelectedCommandCellSize().halfPadding)
                .padding(.top, SelectedCommandCellSize().padding)
            TextField(parameterTitle, text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: SelectedCommandCellSize().textFieldWidth)
                .padding(.bottom, SelectedCommandCellSize().padding)
        }
        .frame(width: SelectedCommandCellSize().parameterCellWidth)
        .background(.white)
        .cornerRadius(SelectedCommandCellSize().cornerRadius)
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
