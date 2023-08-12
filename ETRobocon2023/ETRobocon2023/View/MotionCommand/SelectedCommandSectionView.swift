import SwiftUI
import Combine

struct SelectedCommandSectionView: View {
    @Binding var motionCommands: [MotionCommand]
    let sectionTitle: String
    let isSelected: Bool
    let onUpdate: (CGFloat) -> Void

    var body: some View {
        VStack(spacing: SelectedCommandViewInfo().halfPadding) {
            Text(sectionTitle)
                .font(SelectedCommandViewInfo().commandTitleFont)
                .padding(.top, SelectedCommandViewInfo().padding)

            ForEach($motionCommands) { $motionCommand in
                DistanceLineTraceCell(motionCommand: $motionCommand)
                    .padding(.top, SelectedCommandViewInfo().halfPadding)
            }
            .frame(width: SelectedCommandViewInfo().selectedCommandSectionWidth)
        }
        .padding(.bottom, SelectedCommandViewInfo().padding)
        .frame(width: SelectedCommandViewInfo().selectedCommandSectionWidth)
        .background(SelectedCommandViewInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
        .opacity(isSelected ? 1.0 : 0.3)
        .background(GeometryReader { geometry in
            Color.clear.onReceive(Just(geometry.frame(in: .global).minY)) { minY in
                DispatchQueue.main.async {
                    onUpdate(minY)
                }
            }
        })
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
        SelectedCommandSectionView(motionCommands: $motionCommands, sectionTitle: "スタートからダブルループ直前まで", isSelected: true, onUpdate: { offset in

        })
            .previewLayout(.fixed(width: 700, height: 4000))
    }
}
