import SwiftUI

struct SpecifiedAngleTurningCell: View {
    @Binding var motionCommand: MotionCommand

    var body: some View {
        VStack(spacing: 0) {
            SelectedCommandTitleView(commandTitle: motionCommand.command.rawValue,
                                     commandSubtitle: motionCommand.command.description)

            HStack(spacing: 0) {
                IntParameterCellView(inputNumber: $motionCommand.targetAngle, parameterTitle: "目標角度(°)")
                FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    .padding(.leading, SelectedCommandViewInfo().padding)
                    .padding(.trailing, SelectedCommandViewInfo().padding)
                LOrRParameterCellView(leftOrRight: $motionCommand.directionOfRotation, parameterTitle: "回頭方向")
            } // HStack
            .padding(.bottom, SelectedCommandViewInfo().padding)

        } // VStack
        .frame(width: SelectedCommandViewInfo().selectedCommandCellWidth)
        .background(SelectedCommandViewInfo().selectedCommandCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
    } // var body
}

struct SpecifiedAngleTurningCell_Previews: PreviewProvider {
    @State static var motionCommand = MotionCommand(command: .AR, section: .FromStartToDoubleLoop)
    static var previews: some View {
        SpecifiedAngleTurningCell(motionCommand: $motionCommand)
            .previewLayout(.fixed(width: 550, height: 400))
    }
}
