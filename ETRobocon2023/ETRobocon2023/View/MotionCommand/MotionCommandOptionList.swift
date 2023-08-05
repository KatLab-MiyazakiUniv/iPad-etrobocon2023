import SwiftUI

struct MotionCommandOptionList: View {
    let motionCommands: [any MotionCommand] = [DistanceLineTrace(),
                                               TurningToCompensateForAngle(targetAngle: 0, targetSpeed: 0)
    ]
    
    var body: some View {
        List(motionCommands, id: \.id) { motionCommand in
            MotionCommandOptionCell(motionCommand: motionCommand)
                .listRowSeparator(.hidden)
        }
        .frame(width: 300)
//        VStack {
//            MotionCommandOptionCell(motionCommand: motionCommands[0])
//            MotionCommandOptionCell(motionCommand: motionCommands[1])
//        }
    }
}

struct MotionCommandOptionList_Previews: PreviewProvider {
    static var previews: some View {
        MotionCommandOptionList()
    }
}
