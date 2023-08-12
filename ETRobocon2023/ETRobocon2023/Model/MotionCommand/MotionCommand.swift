import Foundation

struct MotionCommand: Identifiable {
    var id = UUID()
    let command: MotionCommandEnum
    
    var targetDistance = ""
    var targetSpeed = ""
    var adjustment = 0
    var pValue = ""
    var iValue = ""
    var dValue = ""
}
