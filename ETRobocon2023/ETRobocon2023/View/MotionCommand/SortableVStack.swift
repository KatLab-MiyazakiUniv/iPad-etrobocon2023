import SwiftUI
import UniformTypeIdentifiers

struct DraggableVStack: View {
    @State private var items: [String] = ["Item 1", "Item 2", "Item 3"]
    @State private var draggedItem: String?

    var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    Image(systemName: "arrow.up.arrow.down.circle.fill")
                        .foregroundColor(.blue)
                        .onDrag {
                            self.draggedItem = item
                            return NSItemProvider(object: item as NSString)
                        }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .overlay(draggedItem == item ? Color.green.opacity(0.5) : Color.clear)
                .onDrop(of: [UTType.plainText], delegate: MyDropDelegate(item: item, items: $items, draggedItem: $draggedItem))
            }
        }
    }
}

struct MyDropDelegate: DropDelegate {
    var item: String
    @Binding var items: [String]
    @Binding var draggedItem: String?

    func performDrop(info: DropInfo) -> Bool {
        draggedItem = nil
        return true
    }

    func dropEntered(info: DropInfo) {
        guard let fromItem = draggedItem else { return }

        let fromIndex = items.firstIndex(of: fromItem)!
        let toIndex = items.firstIndex(of: item)!

        if fromIndex != toIndex {
            withAnimation {
                items.remove(at: fromIndex)
                items.insert(fromItem, at: toIndex)
            }
        }
    }

    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }

    func dropExited(info: DropInfo) {
        draggedItem = nil
    }
}

struct DraggableVStack_Previews: PreviewProvider {
    static var previews: some View {
        DraggableVStack()
    }
}
