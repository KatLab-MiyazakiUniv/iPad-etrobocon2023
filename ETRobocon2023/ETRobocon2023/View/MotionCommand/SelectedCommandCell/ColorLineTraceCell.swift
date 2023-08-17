//import SwiftUI
//
//struct ColorLineTraceCell: View {
//    @Binding var motionCommand: MotionCommand
//
//    var body: some View {
//        VStack(spacing: 0) {
//            SelectedCommandTitleView(commandTitle: motionCommand.command.rawValue,
//                                     commandSubtitle: motionCommand.command.description)
//
//            HStack(spacing: 0) {
//                ColorParameterCellView(selectedColor: $motionCommand.targetColor, parameterTitle: "目標色")
//                    
//                FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
//                    .padding(.leading, SelectedCommandViewInfo().padding)
//                    .padding(.trailing, SelectedCommandViewInfo().padding)
//                IntParameterCellView(inputNumber: $motionCommand.adjustment, parameterTitle: "輝度調整")
//            } // HStack
//            .padding(.bottom, SelectedCommandViewInfo().padding)
//
//            HStack(spacing: 0) {
//                FloatParameterCellView(inputNumber: $motionCommand.pValue, parameterTitle: "P値")
//                FloatParameterCellView(inputNumber: $motionCommand.iValue, parameterTitle: "I値")
//                    .padding(.leading, SelectedCommandViewInfo().padding)
//                    .padding(.trailing, SelectedCommandViewInfo().padding)
//                FloatParameterCellView(inputNumber: $motionCommand.dValue, parameterTitle: "D値")
//            } // HStack
//            .padding(.bottom, SelectedCommandViewInfo().padding)
//        } // VStack
//        .frame(width: SelectedCommandViewInfo().selectedCommandCellWidth)
//        .background(SelectedCommandViewInfo().selectedCommandCellBackground)
//        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
//    } // var body
//}
//
//extension ColorLineTraceCell: SelectedCommandCell {}
//
//struct ColorLineTraceCell_Previews: PreviewProvider {
//    @State static var motionCommand = MotionCommand(command: .CL)
//    static var previews: some View {
//        ColorLineTraceCell(motionCommand: $motionCommand)
//            .previewLayout(.fixed(width: 550, height: 400))
//    }
//}
