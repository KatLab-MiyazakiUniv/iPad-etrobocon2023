import SwiftUI

struct SelectedCommandSectionView: View {
    @State var motionCommands: [any MotionCommand] = Array(repeating: DistanceLineTrace(), count: 10)
    let sectionTitle: String

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
        .background(SelectedCommandViewInfo().parameterCellBackground)
        .cornerRadius(SelectedCommandViewInfo().cornerRadius)
    }
}

struct SelectedCommandSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCommandSectionView(sectionTitle: "スタートからダブルループ直前まで")
            .previewLayout(.fixed(width: 700, height: 4000))
    }
}
