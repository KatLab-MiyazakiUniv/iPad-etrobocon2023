import SwiftUI

struct LOrRParameterCellView: View {
    @Binding var leftOrRight: LeftOrRightEnum
    let parameterTitle: String

    var body: some View {
        VStack(spacing: 0) {
            Text(parameterTitle)
                .font(SelectedCommandViewInfo().parameterTitleFont)
                .padding(.bottom, SelectedCommandViewInfo().padding)

            Picker("目標色", selection: $leftOrRight) {
                ForEach(LeftOrRightEnum.allCases, id: \.self) { side in
                    Text(side.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: SelectedCommandViewInfo().textFieldWidth)
        }
        .frame(width: SelectedCommandViewInfo().parameterCellWidth)
        .frame(height: 80)
        .background(SelectedCommandViewInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
    }
}

struct LOrRParameterCellView_Previews: PreviewProvider {
    @State static var leftOrRight = LeftOrRightEnum.Left
    static var previews: some View {
        LOrRParameterCellView(leftOrRight: $leftOrRight, parameterTitle: "切り替え後")
    }
}
