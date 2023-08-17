import Foundation

enum MotionCommandEnum: String, CaseIterable {
    case DL // 指定距離ライントレース
    case CL // 指定色ライントレース
    case DS // 指定距離直進
    case CS // 指定色直進
    case AR // 指定角度回頭
    case DT // 旋回
    case EC // エッジ切り替え
    case SL // 自タスクスリープ
    case AU // アームを上げる
    case AD // アームを下げる
    case XR // 角度補正回頭
}

extension MotionCommandEnum: CustomStringConvertible {
    var description: String {
        switch self {
        case .DL: return "指定距離ライントレース"
        case .CL: return "指定色ライントレース"
        case .DS: return "指定距離直進"
        case .CS: return "指定色直進"
        case .AR: return "指定角度回頭"
        case .DT: return "旋回"
        case .EC: return "エッジ切り替え"
        case .SL: return "自タスクスリープ"
        case .AU: return "アームを上げる"
        case .AD: return "アームを下げる"
        case .XR: return "角度補正回頭"
        }
    }
}
