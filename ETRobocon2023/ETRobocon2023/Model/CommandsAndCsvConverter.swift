import Foundation

struct CommandsAndCsvConverter {
    func commandsToCsv(_ array: [[MotionCommand]]) -> String {
        var csvString = ""
        
        for commandArray in array {
            for motionCommand in commandArray {
                addElement(motionCommand.command.rawValue)
                switch motionCommand.command {
                case .DL:
                    addElement("\(motionCommand.targetDistance)")
                    addElement("\(motionCommand.targetSpeed)")
                    addElement("\(motionCommand.adjustment)")
                    addElement("\(motionCommand.pValue)")
                    addElement("\(motionCommand.iValue)")
                    addLastElementInRow("\(motionCommand.dValue)")
                case .CL:
                    addElement("\(motionCommand.targetColor.colorName)")
                    addElement("\(motionCommand.targetSpeed)")
                    addElement("\(motionCommand.adjustment)")
                    addElement("\(motionCommand.pValue)")
                    addElement("\(motionCommand.iValue)")
                    addLastElementInRow("\(motionCommand.dValue)")
                case .DS:
                    addElement("\(motionCommand.targetDistance)")
                    addLastElementInRow("\(motionCommand.targetSpeed)")
                case .CS:
                    addElement("\(motionCommand.targetColor.colorName)")
                    addLastElementInRow("\(motionCommand.targetSpeed)")
                case .AR:
                    addElement("\(motionCommand.targetAngle)")
                    addElement("\(motionCommand.targetSpeed)")
                    addLastElementInRow("\(motionCommand.directionOfRotation == .Left)")
                case .DT:
                    addElement("\(motionCommand.targetDistance)")
                    addElement("\(motionCommand.leftPWM)")
                    addLastElementInRow("\(motionCommand.rightPWM)")
                case .EC:
                    addLastElementInRow("\(motionCommand.targetEdge == .Left)")
                case .SL:
                    addLastElementInRow("\(motionCommand.sleepInterval)")
                case .AU:
                    break
                case .AD:
                    break
                case .XR:
                    addElement("\(motionCommand.targetAngle)")
                    addLastElementInRow("\(motionCommand.targetSpeed)")
                }
            } // for command
        } // for commandArray

        return csvString

        func addElement(_ string: String) {
            csvString += string
            csvString += ","
        }

        func addLastElementInRow(_ string: String) {
            csvString += string
            csvString += "\n"
        }
    } // func commandsToCsv
}
