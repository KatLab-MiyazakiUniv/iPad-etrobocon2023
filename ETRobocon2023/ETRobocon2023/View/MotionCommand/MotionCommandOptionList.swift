import SwiftUI

struct MotionCommandOptionList: View {
    var body: some View {
        List(MotionCommandEnum.allCases, id: \.self) { commandCase in
            MotionCommandOptionCell(motionCommandType: commandCase)
                .listRowSeparator(.hidden)
        }
        .frame(width: 300)
    }
}

struct MotionCommandOptionList_Previews: PreviewProvider {
    static var previews: some View {
        MotionCommandOptionList()
    }
}
