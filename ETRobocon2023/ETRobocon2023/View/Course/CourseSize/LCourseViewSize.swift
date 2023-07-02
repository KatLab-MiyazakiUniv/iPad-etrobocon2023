import Foundation

/// Lコースのビューに関する数値
/// 競技規約上のコースの寸法ではなく，アプリでビューを描画する際に必要な数値
struct LCourseViewSize {
    // スタート位置の青線を描画し始めるx座標
    static var startX: CGFloat {
        LCourseSize.blackLineCornerRadius
        + LCourseSize.bottomBlackStraightLineLength
        + LCourseSize.blackLineCornerRadius
    }

    // スタート位置の青線を描画し始めるy座標
    static var startY: CGFloat {
        0
    }
} // struct LCourseViewSize
