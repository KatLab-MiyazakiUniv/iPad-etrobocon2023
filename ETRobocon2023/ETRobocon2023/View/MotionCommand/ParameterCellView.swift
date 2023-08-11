import SwiftUI

struct ParameterCellWithTextFieldView: View {
    @Binding var inputText: String
    let parameterTitle: String

    var body: some View {
        VStack(spacing: 0) {
            Text(parameterTitle)
                .font(SelectedCommandViewInfo().parameterTitleFont)
                .padding(.bottom, SelectedCommandViewInfo().halfPadding)
                .padding(.top, SelectedCommandViewInfo().padding)
            TextField(parameterTitle, text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: SelectedCommandViewInfo().textFieldWidth)
                .padding(.bottom, SelectedCommandViewInfo().padding)
        }
        .frame(width: SelectedCommandViewInfo().parameterCellWidth)
        .background(SelectedCommandViewInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
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
