import SwiftUI

struct FloatParameterCellView: View {
    @Binding var inputNumber: Float
    let parameterTitle: String

    var body: some View {
        VStack(spacing: 0) {
            Text(parameterTitle)
                .font(SelectedCommandViewInfo().parameterTitleFont)
                .padding(.bottom, SelectedCommandViewInfo().halfPadding)
                .padding(.top, SelectedCommandViewInfo().padding)
            TextField(parameterTitle, value: $inputNumber, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: SelectedCommandViewInfo().textFieldWidth)
                .padding(.bottom, SelectedCommandViewInfo().padding)
        }
        .frame(width: SelectedCommandViewInfo().parameterCellWidth)
        .background(SelectedCommandViewInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
    }
}

struct FloatParameterCellView_Previews: PreviewProvider {
    @State static var inputNumber: Float = 0
    static var previews: some View {
        FloatParameterCellView(inputNumber: $inputNumber, parameterTitle: "輝度調整")
            .previewLayout(.fixed(width: 550, height: 400))
            .background(.black)
    }
}
