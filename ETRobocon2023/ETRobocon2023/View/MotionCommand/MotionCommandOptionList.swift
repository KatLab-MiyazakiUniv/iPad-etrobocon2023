import SwiftUI

struct MotionCommandOptionList: View {
    let motionCommands: [any MotionCommand] = [DistanceLineTrace(),
                                               ColorLineTrace(),
                                               DistanceStraight(),
                                               ColorStraight(),
                                               SpecifiedAngleTurning(),
                                               DistanceSpecifiedTurning(),
                                               EdgeSwitching(),
                                               SleepSelf(),
                                               RaiseArm(),
                                               LowerArm(),
                                               TurningToCompensateForAngle(targetAngle: 0, targetSpeed: 0)
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
