import Foundation

enum MotionCommandEnum: String {
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
