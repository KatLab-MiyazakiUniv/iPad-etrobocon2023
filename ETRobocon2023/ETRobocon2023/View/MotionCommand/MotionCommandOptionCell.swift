import SwiftUI

struct MotionCommandOptionCell: View {
    @EnvironmentObject var viewModel: SelectedCommandViewModel
    let motionCommand: any MotionCommand

    private let cellWidth: CGFloat = 250
    private let cellHeight: CGFloat = 70
    private let textWidth: CGFloat = 200

    var body: some View {
        HStack {
            Button {
//                print(motionCommand.command.rawValue)
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
                Text(motionCommand.processingDetail)
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
    static let motionCommands: [any MotionCommand] = [DistanceLineTrace(),
                                                  TurningToCompensateForAngle(targetAngle: 0, targetSpeed: 0)
    ]
    static var previews: some View {
//        VStack {
//            MotionCommandOptionCell(motionCommand: DistanceLineTrace())
//            MotionCommandOptionCell(motionCommand: TurningToCompensateForAngle(targetAngle: 0, targetSpeed: 0))
//        }
        List(motionCommands, id: \.id) { motionCommand in
            MotionCommandOptionCell(motionCommand: motionCommand)
        }
        .listRowSeparator(.hidden)
        .previewLayout(.fixed(width: 270, height: 500))
    }
}
