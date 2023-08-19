import Foundation

struct pwmAndBrightness: Identifiable {
    var id = UUID()

    let numberOfSeconds: Float
    let leftPwm: Int
    let rightPwm: Int
    let brightness: Int
}
