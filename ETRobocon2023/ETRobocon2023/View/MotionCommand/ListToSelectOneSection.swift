import SwiftUI
import Combine

struct ListToSelectOneSection: View {
    @State private var selectedSection: SectionPattern? = .A
    @State private var sectionPositions: [SectionPattern: CGFloat] = [:]
    let dummyViewHeight: CGFloat = UIScreen.main.bounds.height

    let data: [SectionPattern: [String]] = [
        .A: Array(1...Int.random(in: 1...20)).map { "Item \($0) of Section A" },
        .B: Array(1...Int.random(in: 1...20)).map { "Item \($0) of Section B" },
        .C: Array(1...Int.random(in: 1...20)).map { "Item \($0) of Section C" },
        .D: Array(1...Int.random(in: 1...20)).map { "Item \($0) of Section C" },
        .E: Array(1...Int.random(in: 1...20)).map { "Item \($0) of Section C" },
        .F: Array(1...Int.random(in: 1...20)).map { "Item \($0) of Section C" },
        .G: Array(1...Int.random(in: 1...20)).map { "Item \($0) of Section C" }
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(SectionPattern.allCases, id: \.self) { section in
                    SectionView(section: section, items: data[section] ?? [], isSelected: section == selectedSection) { offset in
                        sectionPositions[section] = offset
                        updateSelectedSection()
                    }
                }
                Color.clear.frame(height: dummyViewHeight)
            }
        }
    }

    func updateSelectedSection() {
        if let closestSection = sectionPositions.sorted(by: { abs($0.value) < abs($1.value) }).first?.key {
            selectedSection = closestSection
        }
    }
}

enum SectionPattern: CaseIterable, CustomStringConvertible {
    case A, B, C, D, E, F, G

    var description: String {
        switch self {
        case .A: return "A"
        case .B: return "B"
        case .C: return "C"
        case .D: return "D"
        case .E: return "E"
        case .F: return "F"
        case .G: return "G"
        }
    }
}

struct SectionView: View {
    let section: SectionPattern
    let items: [String]
    let isSelected: Bool
    let onUpdate: (CGFloat) -> Void

    var body: some View {
        VStack {
            Text("Section \(section.description)")
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
