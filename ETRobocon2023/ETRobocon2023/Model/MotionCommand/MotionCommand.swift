import Foundation

struct MotionCommand: Identifiable {
    var id = UUID()
    let command: MotionCommandEnum
    
    var targetDistance: Float = 0
    var targetSpeed: Float = 0
    var adjustment = 0
    var pValue: Float = 0
    var iValue: Float = 0
    var dValue: Float = 0
}
