import SwiftUI

struct SelectedCommandTitleView: View {
    let commandTitle: String
    let commandSubtitle: String

    var body: some View {
        HStack(spacing: 0) {
            Text(commandTitle)
                .font(SelectedCommandCellInfo().commandTitleFont)
                .padding(.leading, SelectedCommandCellInfo().padding)
            Text(commandSubtitle)
                .font(SelectedCommandCellInfo().commandSubTitleFont)
                .padding(.leading, SelectedCommandCellInfo().padding)
        }
        .padding(.top, SelectedCommandCellInfo().padding)
        .padding(.bottom, SelectedCommandCellInfo().padding)
        .frame(width: SelectedCommandCellInfo().selectedCommandCellWidth, alignment: .leading)
    }
}

struct SelectedCommandTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCommandTitleView(commandTitle: "DL", commandSubtitle: "指定距離ライントレース")
            .previewLayout(.fixed(width: 550, height: 400))
    }
}
