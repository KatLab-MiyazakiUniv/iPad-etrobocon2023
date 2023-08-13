import SwiftUI

struct IntParameterCellView: View {
    @Binding var inputNumber: Int
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

struct IntParameterCellView_Previews: PreviewProvider {
    @State static var inputNumber = 0
    static var previews: some View {
        IntParameterCellView(inputNumber: $inputNumber, parameterTitle: "輝度調整")
            .previewLayout(.fixed(width: 550, height: 400))
            .background(.black)
    }
}
