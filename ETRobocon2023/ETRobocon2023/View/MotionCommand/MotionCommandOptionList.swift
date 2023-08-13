import SwiftUI

struct MotionCommandOptionList: View {
    let motionCommands: [MotionCommand] = [MotionCommand(command: .DL),
                                           MotionCommand(command: .CL),
                                           MotionCommand(command: .DS),
                                           MotionCommand(command: .CS),
                                           MotionCommand(command: .AR),
                                           MotionCommand(command: .DT),
                                           MotionCommand(command: .EC),
                                           MotionCommand(command: .SL),
//                                           MotionCommand(command: .AU),
//                                           MotionCommand(command: .AD),
                                           MotionCommand(command: .XR),
    ]

    var body: some View {
        List(motionCommands, id: \.id) { motionCommand in
            MotionCommandOptionCell(motionCommand: motionCommand)
                .listRowSeparator(.hidden)
        }
        .frame(width: 300)
    }
}

struct MotionCommandOptionList_Previews: PreviewProvider {
    static var previews: some View {
        MotionCommandOptionList()
    }
}
