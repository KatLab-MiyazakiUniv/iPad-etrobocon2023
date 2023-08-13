import SwiftUI

struct SelectedCommandTitleView: View {
    let commandTitle: String
    let commandSubtitle: String

    var body: some View {
        HStack(spacing: 0) {
            Text(commandTitle)
                .font(SelectedCommandViewInfo().commandTitleFont)
                .padding(.leading, SelectedCommandViewInfo().padding)
            Text(commandSubtitle)
                .font(SelectedCommandViewInfo().commandSubTitleFont)
                .padding(.leading, SelectedCommandViewInfo().padding)
        }
        .padding(.top, SelectedCommandViewInfo().padding)
        .padding(.bottom, SelectedCommandViewInfo().padding)
        .frame(width: SelectedCommandViewInfo().selectedCommandCellWidth, alignment: .leading)
    }
}

struct SelectedCommandTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCommandTitleView(commandTitle: "DL", commandSubtitle: "指定距離ライントレース")
            .previewLayout(.fixed(width: 550, height: 400))
    }
}
