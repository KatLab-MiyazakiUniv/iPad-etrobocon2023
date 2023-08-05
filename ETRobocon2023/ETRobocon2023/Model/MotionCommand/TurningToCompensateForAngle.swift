import Foundation

/// ｢角度補正回頭｣を表すコマンド
struct TurningToCompensateForAngle: MotionCommand {
    let command = MotionCommandEnum.XR
    let processingDetail = "角度補正回頭"

    var targetAngle: Double
    var targetSpeed: Double
}
