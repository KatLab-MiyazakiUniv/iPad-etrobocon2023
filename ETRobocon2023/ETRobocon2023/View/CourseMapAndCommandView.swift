//
//  CourseMapAndCommandView.swift
//  ETRobocon2023
//
//  Created by オナガ・ハルキ on 2023/08/06.
//

import SwiftUI

struct CourseMapAndCommandView: View {
    @State private var isAnimating = true

    // 点滅する区間
    @State private var selection = SegmentNames.NONE

    var body: some View {
        HStack {
            MotionCommandOptionList()
            Spacer()
            CourseView(isAnimating: $isAnimating, segment: $selection)
                .scaleEffect(0.26)
                .frame(width: 646,height: 980)
        } // HStack
    }
}

struct CourseMapAndCommandView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMapAndCommandView()
            .previewLayout(.fixed(width: 2732, height: 2048))
    }
}
