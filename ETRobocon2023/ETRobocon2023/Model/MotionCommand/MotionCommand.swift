import Foundation

struct MotionCommand: Identifiable {
    var id = UUID()
    let command: MotionCommandEnum
    
    var targetDistance = ""
    var targetSpeed = ""
    var adjustment = ""
    var pValue = ""
    var iValue = ""
    var dValue = ""
}
