import SwiftUI

/// 区間のリストを表示する．
/// 選択された区間を@Binding selectionに格納する
struct SegmentNamesListView: View {
    // 選択された区間
    @Binding var selection: SegmentNames

    var body: some View {
        List(SegmentNames.allCases, id: \.self) { item in
            Text(item.rawValue.capitalized)
                .foregroundColor(selection == item ? .blue : .black)
                .onTapGesture {
                    selection = item
                }
        }
    } // var body
} // struct SegmentNamesListView

struct SegmentNamesListView_Previews: PreviewProvider {
    @State static var selection = SegmentNames.NONE
    static var previews: some View {
        SegmentNamesListView(selection: $selection)
    }
}
