import SwiftUI

struct SegmentNamesListView: View {
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
