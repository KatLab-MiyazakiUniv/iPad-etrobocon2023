import SwiftUI

struct MotionCommandOptionCell: View {
    @EnvironmentObject var viewModel: SelectedCommandViewModel
    let motionCommand: MotionCommand

    private let cellWidth: CGFloat = 250
    private let cellHeight: CGFloat = 70
    private let textWidth: CGFloat = 200

    var body: some View {
        HStack {
            Button {
                viewModel.addSelectedCommand(motionCommand)
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFill()
            }
            .buttonStyle(BorderlessButtonStyle())

            VStack {
                Text(motionCommand.command.rawValue)
                    .frame(width: textWidth, alignment: .leading)
                    .font(.system(size: 23, weight: .bold))
                Text(motionCommand.command.description)
                    .frame(width: textWidth, alignment: .leading)
                    .font(.system(size: 17, weight: .light))
            } // VStack
            .frame(width: textWidth)
        } // HStack
        .frame(width: cellWidth, height: cellHeight)
        .background(Color(red: 0.92, green: 0.92, blue: 0.92))
        .cornerRadius(15)
    }
}

struct MotionCommandOptionCell_Previews: PreviewProvider {
    static let motionCommands: [MotionCommand] = [MotionCommand(command: .DL)]
    static var previews: some View {
        List(motionCommands, id: \.id) { motionCommand in
            MotionCommandOptionCell(motionCommand: motionCommand)
        }
        .listRowSeparator(.hidden)
        .previewLayout(.fixed(width: 270, height: 500))
    }
}
