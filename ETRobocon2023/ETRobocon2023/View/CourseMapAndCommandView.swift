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
            ZStack {
                Rectangle()
                    .frame(width: 560)
                .foregroundStyle(.pink)

                DistanceLineTraceCell()
            }
            CourseView(isAnimating: $isAnimating, segment: $selection)
                .scaleEffect(0.2)
                .frame(width: 500,height: 980)
                .background(.white)
        } // HStack
        .background(.black)
    }
}

struct CourseMapAndCommandView_Previews: PreviewProvider {
    static var previews: some View {
        CourseMapAndCommandView()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
