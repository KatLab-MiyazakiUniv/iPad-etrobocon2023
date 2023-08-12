import SwiftUI

struct DistanceLineTraceCell: View {
    @Binding var motionCommand: MotionCommand

    var body: some View {
        VStack(spacing: 0) {
            SelectedCommandTitleView(commandTitle: MotionCommandEnum.DL.rawValue, commandSubtitle: MotionCommandEnum.DL.description)

            HStack(spacing: 0) {
                FloatParameterCellView(inputNumber: $motionCommand.targetDistance, parameterTitle: "目標距離(mm)")
                FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    .padding(.leading, SelectedCommandViewInfo().padding)
                    .padding(.trailing, SelectedCommandViewInfo().padding)
                IntParameterCellView(inputNumber: $motionCommand.adjustment, parameterTitle: "輝度調整")
            } // HStack
            .padding(.bottom, SelectedCommandViewInfo().padding)

            HStack(spacing: 0) {
                FloatParameterCellView(inputNumber: $motionCommand.pValue, parameterTitle: "P値")
                FloatParameterCellView(inputNumber: $motionCommand.iValue, parameterTitle: "I値")
                    .padding(.leading, SelectedCommandViewInfo().padding)
                    .padding(.trailing, SelectedCommandViewInfo().padding)
                FloatParameterCellView(inputNumber: $motionCommand.dValue, parameterTitle: "D値")
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
    @State static var motionCommand = MotionCommand(command: .DL)
    static var previews: some View {
        DistanceLineTraceCell(motionCommand: $motionCommand)
            .previewLayout(.fixed(width: 550, height: 400))
    }
}
