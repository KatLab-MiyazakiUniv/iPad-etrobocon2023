import SwiftUI

struct DistanceLineTraceCell: View {
    @State private var targetDistance = ""
    @State private var targetSpeed = ""
    @State private var adjustment = ""
    @State private var pValue = ""
    @State private var iValue = ""
    @State private var dValue = ""

    var body: some View {
        VStack(spacing: 0) {
            SelectedCommandTitleView(commandTitle: "DL", commandSubtitle: "指定距離ライントレース")

            HStack(spacing: 0) {
                ParameterCellWithTextFieldView(inputText: $targetDistance, parameterTitle: "目標距離(mm)")
                ParameterCellWithTextFieldView(inputText: $targetSpeed, parameterTitle: "目標速度(mm/s)")
                    .padding(.leading, SelectedCommandViewInfo().padding)
                    .padding(.trailing, SelectedCommandViewInfo().padding)
                ParameterCellWithTextFieldView(inputText: $adjustment, parameterTitle: "輝度調整")
            } // HStack
            .padding(.bottom, SelectedCommandViewInfo().padding)

            HStack(spacing: 0) {
                ParameterCellWithTextFieldView(inputText: $targetDistance, parameterTitle: "P値")
                ParameterCellWithTextFieldView(inputText: $targetSpeed, parameterTitle: "I値")
                    .padding(.leading, SelectedCommandViewInfo().padding)
                    .padding(.trailing, SelectedCommandViewInfo().padding)
                ParameterCellWithTextFieldView(inputText: $adjustment, parameterTitle: "D値")
            } // HStack
            .padding(.bottom, SelectedCommandViewInfo().padding)
        } // VStack
        .frame(width: SelectedCommandViewInfo().selectedCommandCellWidth)
        .background(SelectedCommandViewInfo().selectedCommandCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
    } // var body
}

extension DistanceLineTraceCell: SelectedCommandCell {}

struct DistanceLineTraceCell_Previews: PreviewProvider {
    static var previews: some View {
        DistanceLineTraceCell()
            .previewLayout(.fixed(width: 550, height: 400))
    }
}
