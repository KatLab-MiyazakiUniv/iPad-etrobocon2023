//
//  DistanceLineTraceCell.swift
//  ETRobocon2023
//
//  Created by オナガ・ハルキ on 2023/08/10.
//

import SwiftUI

struct DistanceLineTraceCell: View {
    @State private var targetDistance = ""
    @State private var targetSpeed = ""
    @State private var adjustment = ""
    @State private var pValue = ""
    @State private var iValue = ""
    @State private var dValue = ""

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("   DL")
                    .font(.system(size: 23, weight: .bold))
                Text("     指定距離ライントレース")
                    .font(.system(size: 17, weight: .light))
            }
            .padding()
            .frame(width: selectedCommandCellWidth, alignment: .leading)
//            .background(Color(red: 0.92, green: 0.92, blue: 0.92))

            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("目標距離")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 5)
                    TextField("目標距離", text: $targetDistance)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: selectedCommandCellWidth/3 - 50)
                }
                .padding()
                .frame(width: selectedCommandCellWidth/3 - 20)
                .background(.white)
                .cornerRadius(15)


                VStack(spacing: 0) {
                    Text("目標速度")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 5)
                    TextField("目標速度", text: $targetSpeed)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: selectedCommandCellWidth/3 - 50)
                }
                .padding()
                .frame(width: selectedCommandCellWidth/3 - 20)
                .background(.white)
                .cornerRadius(15)

                VStack(spacing: 0) {
                    Text("調整")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 5)
                    TextField("調整", text: $adjustment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: selectedCommandCellWidth/3 - 50)
                }
                .padding()
                .frame(width: selectedCommandCellWidth/3 - 20)
                .background(.white)
                .cornerRadius(15)
            } // HStack
            .frame(width: selectedCommandCellWidth - 20)

//            .background(.green)

            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("P値")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 5)
                    TextField("P値", text: $pValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: selectedCommandCellWidth/3 - 50)
                }
                .padding()
                .frame(width: selectedCommandCellWidth/3 - 20)
                .background(.white)
                .cornerRadius(15)

                VStack(spacing: 0) {
                    Text("I値")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 5)
                    TextField("I値", text: $iValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: selectedCommandCellWidth/3 - 50)
                }
                .padding()
                .frame(width: selectedCommandCellWidth/3 - 20)
                .background(.white)
                .cornerRadius(15)

                VStack(spacing: 0) {
                    Text("D値")
                        .font(.system(size: 17, weight: .bold))
                        .padding(.bottom, 5)
                    TextField("D値", text: $dValue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: selectedCommandCellWidth/3 - 50)
                }
                .padding()
                .frame(width: selectedCommandCellWidth/3 - 20)
                .background(.white)
                .cornerRadius(15)
            } // HStack
            .frame(width: selectedCommandCellWidth - 20)
//            .background(.white)
        } // VStack
        .frame(width: SelectedCommandCellInfo().selectedCommandCellWidth)
        .background(SelectedCommandCellInfo().selectedCommandCellBackground)
//        .background(.gray)
    }
}

extension DistanceLineTraceCell: SelectedCommandCell {}

struct DistanceLineTraceCell_Previews: PreviewProvider {
    static var previews: some View {
        DistanceLineTraceCell()
            .previewLayout(.fixed(width: 550, height: 400))
    }
}
