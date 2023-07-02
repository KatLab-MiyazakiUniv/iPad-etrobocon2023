import Foundation

/// Lコースの各部分の寸法
struct LCourseSize {
    // MARK: ライントレース
    // 線の太さ
    // ライントレースの黒線や，ブロックdeトレジャーの円，青線
    static let lineWidth: CGFloat = 20

    // コース右側の，スタート直後の直進の長さ
    static let rightBlackStraightLineLength: CGFloat = 2980

    // コース下部の直進の長さ
    static let bottomBlackStraightLineLength: CGFloat = 1815

    // コース左側の直進の長さ
    static let leftBlackStraightLineLength: CGFloat = 1840

    // コース右下と左下の黒いカーブを円周の1/4としたとき，その円の半径
    static let blackLineCornerRadius: CGFloat = 210


    // MARK: 青線
    // スタート位置の青線の長さ
    static let startBlueLineLength: CGFloat = 200

    // ダブルループに入る部分の青線の長さ
    static let doubleLoopEntranceBlueLineLength: CGFloat = 250


    // MARK: ダブルループ
    // カーブの終わりからダブルループの枝分かれまでの距離
    static let endOfCornerToBranchingLength: CGFloat = 270
} // struct LCourseSize
