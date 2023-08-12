import SwiftUI
import Combine

struct SelectedCommandSectionView: View {
    @Binding var motionCommands: [MotionCommand]
    let sectionTitle: String
    let isSelected: Bool

    var body: some View {
        VStack(spacing: SelectedCommandViewInfo().halfPadding) {
            Text(sectionTitle)
                .font(SelectedCommandViewInfo().commandTitleFont)
                .padding(.top, SelectedCommandViewInfo().padding)

            ForEach($motionCommands) { $motionCommand in
                switch motionCommand.command {
                case .DL:
                    DistanceLineTraceCell(motionCommand: $motionCommand)
                        .padding(.top, SelectedCommandViewInfo().halfPadding)
                case .CL:
                    ColorLineTraceCell(motionCommand: $motionCommand)
                        .padding(.top, SelectedCommandViewInfo().halfPadding)
                case .AR:
                    SpecifiedAngleTurningCell(motionCommand: $motionCommand)
                        .padding(.top, SelectedCommandViewInfo().halfPadding)
                default:
                    DistanceLineTraceCell(motionCommand: $motionCommand)
                        .padding(.top, SelectedCommandViewInfo().halfPadding)
                }
            }
            .frame(width: SelectedCommandViewInfo().selectedCommandSectionWidth)
        }
        .padding(.bottom, SelectedCommandViewInfo().padding)
        .frame(width: SelectedCommandViewInfo().selectedCommandSectionWidth)
        .background(SelectedCommandViewInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
        .opacity(isSelected ? 1.0 : 0.3)
    }
}

struct SelectedCommandSectionView_Previews: PreviewProvider {
    @State static var motionCommands: [MotionCommand] = [MotionCommand(command: .DL),
                                                         MotionCommand(command: .CL),
                                                         MotionCommand(command: .DS),
                                                         MotionCommand(command: .CS),
                                                         MotionCommand(command: .AR),
                                                         MotionCommand(command: .DT),
                                                         MotionCommand(command: .EC),
                                                         MotionCommand(command: .SL),
                                                         MotionCommand(command: .AU),
                                                         MotionCommand(command: .AD),
                                                         MotionCommand(command: .XR),
    ]
    static var previews: some View {
        SelectedCommandSectionView(motionCommands: $motionCommands, sectionTitle: "スタートからダブルループ直前まで", isSelected: true)
            .previewLayout(.fixed(width: 700, height: 4000))
    }
}
