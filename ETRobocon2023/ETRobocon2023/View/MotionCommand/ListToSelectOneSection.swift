import SwiftUI
import Combine

struct ListToSelectOneSection: View {
    @State private var selectedSection: Int? = 0
    @State private var sectionPositions: [Int: CGFloat] = [:]
    let dummyViewHeight: CGFloat = UIScreen.main.bounds.height

    let data = Array(1...10).map { section -> (section: Int, items: [String]) in
        let itemCount = Int.random(in: 1...20)
        return (section, Array(1...itemCount).map { item in "Item \(item) of Section \(section)" })
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(data, id: \.section) { sectionData in
                    SectionView(section: sectionData.section, items: sectionData.items, isSelected: sectionData.section == selectedSection) { offset in
                        sectionPositions[sectionData.section] = offset
                        updateSelectedSection()
                    }
                }
                Color.clear.frame(height: dummyViewHeight)
            }
        }
    }

    func updateSelectedSection() {
        let sortedSections = sectionPositions.sorted(by: { abs($0.value) < abs($1.value) })
        if let closestSection = sortedSections.first?.key {
            selectedSection = closestSection
        }
    }
}

struct SectionView: View {
    let section: Int
    let items: [String]
    let isSelected: Bool
    let onUpdate: (CGFloat) -> Void

    var body: some View {
        VStack {
            Text("Section \(section)")
                .font(.headline)
                .padding()
                .background(Color.gray.opacity(0.2))
            ForEach(items, id: \.self) { item in
                Text(item)
                    .padding()
            }
        }
        .opacity(isSelected ? 1.0 : 0.5)
        .background(isSelected ? .green.opacity(0.3) : .clear)
        .background(GeometryReader { geometry in
            Color.clear.onReceive(Just(geometry.frame(in: .global).minY)) { minY in
                DispatchQueue.main.async {
                    onUpdate(minY)
                }
            }
        })
    }
}

struct ListToSelectOneSection_Previews: PreviewProvider {
    static var previews: some View {
        ListToSelectOneSection()
    }
}
