import Foundation

struct PwmAndBrightness: Identifiable {
    var id = UUID()

    let numberOfSeconds: Float
//    let leftPwm: Int
//    let rightPwm: Int
//    let brightness: Int
    let category: Category
    let value: Int

    enum Category: CustomStringConvertible {
        case LeftPwm
        case RightPwm
        case Brightness

        var description: String {
            switch self {
            case .LeftPwm: return "左PWM"
            case .RightPwm: return "右PWM"
            case .Brightness: return "輝度"
            }
        }
    }
}
