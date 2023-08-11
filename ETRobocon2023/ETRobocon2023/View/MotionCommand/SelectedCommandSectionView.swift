import SwiftUI
import Combine

struct SelectedCommandSectionView: View {
//    @State var motionCommands: [any MotionCommand] = Array(repeating: DistanceLineTrace(), count: 10)
    @Binding var motionCommands: [any MotionCommand]
    let sectionTitle: String
    let isSelected: Bool
    let onUpdate: (CGFloat) -> Void

    var body: some View {
        VStack(spacing: SelectedCommandViewInfo().halfPadding) {
            Text(sectionTitle)
                .font(SelectedCommandViewInfo().commandTitleFont)
                .padding(.top, SelectedCommandViewInfo().padding)

            ForEach(motionCommands, id: \.id) { motionCommand in
                DistanceLineTraceCell()
                    .padding(.top, SelectedCommandViewInfo().halfPadding)
            }
            .frame(width: SelectedCommandViewInfo().selectedCommandSectionWidth)
        }
        .padding(.bottom, SelectedCommandViewInfo().padding)
        .frame(width: SelectedCommandViewInfo().selectedCommandSectionWidth)
//        .frame(minHeight: 400)
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
    @State static var motionCommands: [any MotionCommand] = Array(repeating: DistanceLineTrace(), count: 10)
    static var previews: some View {
        SelectedCommandSectionView(motionCommands: $motionCommands, sectionTitle: "スタートからダブルループ直前まで", isSelected: true, onUpdate: { offset in

        })
            .previewLayout(.fixed(width: 700, height: 4000))
    }
}
