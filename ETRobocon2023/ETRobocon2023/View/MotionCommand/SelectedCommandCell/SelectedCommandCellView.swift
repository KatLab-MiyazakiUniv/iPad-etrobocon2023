import SwiftUI

struct SelectedCommandCellView: View {
    @EnvironmentObject var viewModel: SelectedCommandViewModel
    @Binding var motionCommand: MotionCommand

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                SelectedCommandTitleView(commandTitle: motionCommand.command.rawValue,
                                         commandSubtitle: motionCommand.command.description)
                .padding(.leading, SelectedCommandViewInfo().padding)

                Spacer()

                Image(systemName: "trash.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundStyle(.red)
                    .onTapGesture {
                        withAnimation {
                            viewModel.deleteSelectedCommand(motionCommand)
                        }
                    }
                
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(width: SelectedCommandViewInfo().padding*2)
            }

            // 1段目
            HStack(spacing: 0) {
                // 左
                Group {
                    switch motionCommand.command {
                    case .DL:
                        FloatParameterCellView(inputNumber: $motionCommand.targetDistance, parameterTitle: "目標距離(mm)")
                    case .CL:
                        ColorParameterCellView(selectedColor: $motionCommand.targetColor, parameterTitle: "目標色")
                    case .DS:
                        FloatParameterCellView(inputNumber: $motionCommand.targetDistance, parameterTitle: "目標距離(mm)")
                    case .CS:
                        ColorParameterCellView(selectedColor: $motionCommand.targetColor, parameterTitle: "目標色")
                    case .AR:
                        IntParameterCellView(inputNumber: $motionCommand.targetAngle, parameterTitle: "目標角度(°)")
                    case .DT:
                        FloatParameterCellView(inputNumber: $motionCommand.targetDistance, parameterTitle: "目標距離(mm)")
                    case .EC:
                        LOrRParameterCellView(leftOrRight: $motionCommand.targetEdge, parameterTitle: "切り替え後")
                    case .SL:
                        IntParameterCellView(inputNumber: $motionCommand.sleepInterval, parameterTitle: "(mms)")
                    case .AU: EmptyView()
                    case .AD: EmptyView()
                    case .XR:
                        IntParameterCellView(inputNumber: $motionCommand.targetAngle, parameterTitle: "目標角度(°)")
                    }
                }
                .padding(.leading, SelectedCommandViewInfo().padding)

                // 中央
                Group {
                    switch motionCommand.command {
                    case .DL:
                        FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    case .CL:
                        FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    case .DS:
                        FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    case .CS:
                        FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    case .AR:
                        FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    case .DT:
                        IntParameterCellView(inputNumber: $motionCommand.leftPWM, parameterTitle: "左モータ(PWM)")
                    case .EC: EmptyView()
                    case .SL: EmptyView()
                    case .AU: EmptyView()
                    case .AD: EmptyView()
                    case .XR:
                        FloatParameterCellView(inputNumber: $motionCommand.targetSpeed, parameterTitle: "目標速度(mm/s)")
                    }
                }
                .padding(.leading, SelectedCommandViewInfo().padding)
                .padding(.trailing, SelectedCommandViewInfo().padding)

                // 右
                switch motionCommand.command {
                case .DL:
                    IntParameterCellView(inputNumber: $motionCommand.adjustment, parameterTitle: "輝度調整")
                case .CL:
                    IntParameterCellView(inputNumber: $motionCommand.adjustment, parameterTitle: "輝度調整")
                case .DS: Spacer()
                case .CS: Spacer()
                case .AR:
                    LOrRParameterCellView(leftOrRight: $motionCommand.directionOfRotation, parameterTitle: "回頭方向")
                case .DT:
                    IntParameterCellView(inputNumber: $motionCommand.rightPWM, parameterTitle: "右モータ(PWM)")
                case .EC: Spacer()
                case .SL: Spacer()
                case .AU: EmptyView()
                case .AD: EmptyView()
                case .XR: Spacer()
                }

                Spacer()
            } // HStack

            // 1段目と2段目の間の余白
            switch motionCommand.command {
            case .DL:
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(height: SelectedCommandViewInfo().padding)
            case .CL:
                Rectangle()
                    .foregroundStyle(.clear)
                    .frame(height: SelectedCommandViewInfo().padding)
            case .DS: EmptyView()
            case .CS: EmptyView()
            case .AR: EmptyView()
            case .DT: EmptyView()
            case .EC: EmptyView()
            case .SL: EmptyView()
            case .AU: EmptyView()
            case .AD: EmptyView()
            case .XR: EmptyView()
            }

            // 2段目
            HStack(spacing: 0) {
                // 左
                switch motionCommand.command {
                case .DL:
                    FloatParameterCellView(inputNumber: $motionCommand.pValue, parameterTitle: "P値")
                case .CL:
                    FloatParameterCellView(inputNumber: $motionCommand.pValue, parameterTitle: "P値")
                case .DS: EmptyView()
                case .CS: EmptyView()
                case .AR: EmptyView()
                case .DT: EmptyView()
                case .EC: EmptyView()
                case .SL: EmptyView()
                case .AU: EmptyView()
                case .AD: EmptyView()
                case .XR: EmptyView()
                }

                // 中央
                Group {
                    switch motionCommand.command {
                    case .DL:
                        FloatParameterCellView(inputNumber: $motionCommand.iValue, parameterTitle: "I値")
                    case .CL:
                        FloatParameterCellView(inputNumber: $motionCommand.iValue, parameterTitle: "I値")
                    case .DS: EmptyView()
                    case .CS: EmptyView()
                    case .AR: EmptyView()
                    case .DT: EmptyView()
                    case .EC: EmptyView()
                    case .SL: EmptyView()
                    case .AU: EmptyView()
                    case .AD: EmptyView()
                    case .XR: EmptyView()
                    }
                }
                .padding(.leading, SelectedCommandViewInfo().padding)
                .padding(.trailing, SelectedCommandViewInfo().padding)

                // 右
                switch motionCommand.command {
                case .DL:
                    FloatParameterCellView(inputNumber: $motionCommand.dValue, parameterTitle: "D値")
                case .CL:
                    FloatParameterCellView(inputNumber: $motionCommand.dValue, parameterTitle: "D値")
                case .DS: EmptyView()
                case .CS: EmptyView()
                case .AR: EmptyView()
                case .DT: EmptyView()
                case .EC: EmptyView()
                case .SL: EmptyView()
                case .AU: EmptyView()
                case .AD: EmptyView()
                case .XR: EmptyView()
                }
            } // HStack

            Rectangle()
                .foregroundStyle(.clear)
                .frame(height: SelectedCommandViewInfo().padding)
        } // VStack
        .frame(width: SelectedCommandViewInfo().selectedCommandCellWidth)
        .background(SelectedCommandViewInfo().selectedCommandCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
    } // var body
} // struct SelectedCommandCellView

struct SelectedCommandCellView_Previews: PreviewProvider {
    @State static var motionCommands: [MotionCommand] = [MotionCommand(command: .DL, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .CL, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .DS, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .CS, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .AR, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .DT, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .EC, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .SL, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .AU, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .AD, section: .FromStartToDoubleLoop),
                                                         MotionCommand(command: .XR, section: .FromStartToDoubleLoop),
    ]
    static var previews: some View {
        List {
            ForEach($motionCommands, id: \.id) { $motionCommand in
                SelectedCommandCellView(motionCommand: $motionCommand)
            }
            .onMove(perform: { indices, newOffset in

            })
        }
        .environment(\.editMode, .constant(.active))
        .environmentObject(SelectedCommandViewModel())
        .previewLayout(.fixed(width: SelectedCommandViewInfo().selectedCommandListWidth + 52, height: 1650))
    }
}
