import SwiftUI

struct ColorParameterCellView: View {
    @Binding var selectedColor: TargetColorEnum
    let parameterTitle: String

    var body: some View {
        VStack(spacing: 0) {
            Text(parameterTitle)
                .font(SelectedCommandViewInfo().parameterTitleFont)
                .padding(.bottom, SelectedCommandViewInfo().halfPadding)

            HStack {
                if selectedColor == .White {
                    Circle()
                        .stroke(.gray, lineWidth: 2)
                        .frame(width: 20)
                        .foregroundStyle(selectedColor.color)
                        .padding(.leading, SelectedCommandViewInfo().padding)
                } else {
                    Circle()
                        .frame(width: 20)
                        .foregroundStyle(selectedColor.color)
                        .padding(.leading, SelectedCommandViewInfo().padding)
                }

                Spacer()

                Picker("目標色", selection: $selectedColor) {
                    ForEach(TargetColorEnum.allCases, id: \.self) { color in
                        Text(color.colorName)
                            .foregroundStyle(.black)
                    }
                }
                .labelsHidden()
                .pickerStyle(MenuPickerStyle())
                .clipped()
                .padding(.trailing, SelectedCommandViewInfo().padding)
            }
        }
        .frame(width: SelectedCommandViewInfo().parameterCellWidth)
        .frame(height: 80)
        .background(SelectedCommandViewInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
    }
}

struct ColorParameterCellView_Previews: PreviewProvider {
    @State static var selectedColor = TargetColorEnum.Yellow
    static var previews: some View {
        ColorParameterCellView(selectedColor: $selectedColor, parameterTitle: "目標色")
            .previewLayout(.fixed(width: 550, height: 400))
            .background(.black)
    }
}
