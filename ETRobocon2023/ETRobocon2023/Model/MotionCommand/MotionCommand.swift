import Foundation

struct MotionCommand: Identifiable {
    var id = UUID()
    let command: MotionCommandEnum
    
    var targetDistance: Float = 0
    var targetColor = TargetColorEnum.Black
    var targetAngle = 0
    var targetSpeed: Float = 0
    var targetEdge = LeftOrRightEnum.Left
    var adjustment = 0
    var pValue: Float = 0
    var iValue: Float = 0
    var dValue: Float = 0
    var directionOfRotation = LeftOrRightEnum.Left
    var leftPWM = 0
    var rightPWM = 0
    var sleepInterval = 0
}
