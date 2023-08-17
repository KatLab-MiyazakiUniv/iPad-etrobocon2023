import SwiftUI

struct MotionCommandOptionList: View {
    let motionCommands: [MotionCommand] = [MotionCommand(command: .DL, section: .FromStartToDoubleLoop),
                                           MotionCommand(command: .CL, section: .FromStartToDoubleLoop),
                                           MotionCommand(command: .DS, section: .FromStartToDoubleLoop),
                                           MotionCommand(command: .CS, section: .FromStartToDoubleLoop),
                                           MotionCommand(command: .AR, section: .FromStartToDoubleLoop),
                                           MotionCommand(command: .DT, section: .FromStartToDoubleLoop),
                                           MotionCommand(command: .EC, section: .FromStartToDoubleLoop),
                                           MotionCommand(command: .SL, section: .FromStartToDoubleLoop),
//                                           MotionCommand(command: .AU),
//                                           MotionCommand(command: .AD),
                                           MotionCommand(command: .XR, section: .FromStartToDoubleLoop)
    ]

    var body: some View {
        List(MotionCommandEnum.allCases, id: \.self) { commandCase in
            MotionCommandOptionCell(motionCommandType: commandCase)
        }
        .frame(width: 300)
    }
}

struct MotionCommandOptionList_Previews: PreviewProvider {
    static var previews: some View {
        MotionCommandOptionList()
    }
}
