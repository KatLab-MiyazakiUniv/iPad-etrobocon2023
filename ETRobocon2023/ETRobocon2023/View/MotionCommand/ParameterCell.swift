import Foundation

protocol ParameterCell: SelectedCommandCell {}

extension ParameterCell {
    var parameterCellWidth: CGFloat {
        (selectedCommandCellWidth - padding*4)/3
    }

    var textFieldWidth: CGFloat {
        parameterCellWidth - padding*2
    }
}
