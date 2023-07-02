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


    // MARK: 配置エリアAとB共通
    // 配置エリアAとBの中心の点線の円の半径
    static let blueDottedCircleRadius: CGFloat = 30

    // 配置エリアAとBの中心の点線の円の線の太さ
    static let blueDottedCircleLineWidth: CGFloat = 7

    // 配置エリアAとBの中心の点線の円における，点線の間隔
    static let blueDottedCircleSpacing: CGFloat = 8.5


    // MARK: ブロックdeトレジャー
    // ライントレース終端の円と，ブロックdeトレジャーの左下の円の中心間の距離
    static let distanceBetweenLineTraceEndAndTreasure: CGFloat = 587

    // ライントレース終端とブロックdeトレジャーの小さい円の半径
    static let treasureCircleRadius: CGFloat = 40

    // ブロックdeトレジャーの小さい円の最大直径
    static var treasureCircleMaximumDiameter: CGFloat {
        lineHalfWidth + treasureCircleRadius*2 + lineHalfWidth
    }

    // ブロックdeトレジャーの黒線の長さ
    static let blockDeTreasureBlackLineLength: CGFloat = 250

    // 線の太さの半分
    static var lineHalfWidth: CGFloat {
        lineWidth/2
    }

    // ブロックdeトレジャーの隣接する小さい円の中心間の距離
    static var distanceBetweenCenterOfCirclesInBlockDeTreasure: CGFloat {
        treasureCircleRadius + lineHalfWidth + blockDeTreasureBlackLineLength + lineHalfWidth + treasureCircleRadius
    }
} // struct LCourseSize
