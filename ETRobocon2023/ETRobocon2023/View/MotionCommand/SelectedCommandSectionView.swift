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
                SelectedCommandCellView(motionCommand: $motionCommand)
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
        SelectedCommandSectionView(motionCommands: $motionCommands, sectionTitle: "スタートからダブルループ直前まで", isSelected: true)
            .previewLayout(.fixed(width: 700, height: 1650))
    }
}
