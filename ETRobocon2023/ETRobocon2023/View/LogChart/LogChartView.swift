import SwiftUI
import Charts

struct LogChartView: View {
    @StateObject private var viewModel = LogChartViewModel()
    @State private var showLeftPwm = true
    @State private var showRightPwm = true
    @State private var showBrightness = true
    @State private var yMax = 150
    @State private var yMin = 0

    private let yMaxRange = [400, 350, 300, 250, 200, 150, 100, 50]
    private let yMinRange = [0, -50, -100, -150, -200, -250, -300, -350, -400]

    var body: some View {
        VStack {
            HStack {
                Chart(viewModel.pwmAndBrightness) { data in
                    switch data.category {
                    case .LeftPwm:
                        if showLeftPwm {
                            LineMark(x: .value("Seconds", data.numberOfSeconds),
                                     y: .value("Value", data.value))
                            .foregroundStyle(by: .value("Category", data.category.description))
                        }
                    case .RightPwm:
                        if showRightPwm {
                            LineMark(x: .value("Seconds", data.numberOfSeconds),
                                     y: .value("Value", data.value))
                            .foregroundStyle(by: .value("Category", data.category.description))
                        }
                    case .Brightness:
                        if showBrightness {
                            LineMark(x: .value("Seconds", data.numberOfSeconds),
                                     y: .value("Value", data.value))
                            .foregroundStyle(by: .value("Category", data.category.description))
                        }
                    }
                } // Chart
                .onAppear {
                    viewModel.loadPwmAndBrightness()
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
//                    AxisMarks(position: .trailing)
                }
                .chartXAxisLabel("秒数", position: .bottomTrailing)
                .chartYAxisLabel("値", position: .leading)
                .chartYScale(domain: yMin...yMax)
                .chartXScale(domain: 0...(viewModel.pwmAndBrightness.last?.numberOfSeconds ?? 200) )
                .chartForegroundStyleScale([PwmAndBrightness.Category.LeftPwm.description: .blue,
                                            PwmAndBrightness.Category.RightPwm.description: .red,
                                            PwmAndBrightness.Category.Brightness.description: .black,
                                           ])
                .padding()

                VStack {
                    Picker(selection: $yMax, label: Text("Yの最大値")) {
                        ForEach(yMaxRange, id: \.self) { num in
                            Text("\(num)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    Spacer()
                    Picker(selection: $yMin, label: Text("Yの最小値")) {
                        ForEach(yMinRange, id: \.self) { num in
                            Text("\(num)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .frame(width: 100)
            }

            HStack {
                Spacer()
                HStack(spacing: 0) {
                    Text("左PWM")
                        .foregroundStyle(.blue)
                    Spacer()
                    Toggle("左PWM", isOn: $showLeftPwm)
                        .labelsHidden()
                }
                .frame(width: 120)
                Spacer()
                HStack {
                    Text("右PWM")
                        .foregroundStyle(.red)
                    Spacer()
                    Toggle("右PWM", isOn: $showRightPwm)
                        .labelsHidden()
                }
                .frame(width: 120)
                Spacer()
                HStack {
                    Text("輝度")
                        .foregroundStyle(.black)
                    Spacer()
                    Toggle("輝度", isOn: $showBrightness)
                        .labelsHidden()
                }
                .frame(width: 120)
                Spacer()
            } // HStack

//            Button {
//                viewModel.loadPwmAndBrightness()
//            } label: {
//                Text("Show Chart")
//            }
        } // VStack
    } // var body
}

struct LogChartView_Previews: PreviewProvider {
    static var previews: some View {
        LogChartView()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
