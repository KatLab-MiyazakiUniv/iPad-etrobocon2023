import Foundation
import SwiftUI

struct SelectedCommandViewInfo {
    let selectedCommandSectionWidth: CGFloat = 530
    var selectedCommandCellWidth: CGFloat {
        selectedCommandSectionWidth - padding*2
    }
    let padding: CGFloat = 10
    let cornerRadius: CGFloat = 15

    var halfPadding: CGFloat {
        padding/2
    }

    var parameterCellWidth: CGFloat {
        (selectedCommandCellWidth - padding*4)/3
    }

    var textFieldWidth: CGFloat {
        parameterCellWidth - padding*2
    }

    let commandTitleFont: Font = .system(size: 23, weight: .bold)
    let commandSubTitleFont: Font = .system(size: 17, weight: .light)
    let parameterTitleFont: Font = .system(size: 17, weight: .bold)

    let selectedCommandCellBackground = Color(red: 0.92, green: 0.92, blue: 0.92)
    let parameterCellBackground: Color = .white
}
