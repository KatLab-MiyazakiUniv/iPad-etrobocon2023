import Foundation

struct SelectedCommandCellSize {
    let selectedCommandCellWidth: CGFloat = 530
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

    let commandFontSize: CGFloat = 23
    let parameterFontSize: CGFloat = 17
}
