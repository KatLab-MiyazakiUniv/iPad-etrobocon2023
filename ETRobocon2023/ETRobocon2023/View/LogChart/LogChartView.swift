import SwiftUI
import Charts

struct LogChartView: View {
    @StateObject private var viewModel = LogChartViewModel()
    @State private var showLeftPwm = true
    @State private var showRightPwm = true
    @State private var showBrightness = true

    var body: some View {
        VStack {
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
            .chartYScale(domain: -10...150)
            .chartXScale(domain: 0...(viewModel.pwmAndBrightness.last?.numberOfSeconds ?? 200) )
            .chartForegroundStyleScale([PwmAndBrightness.Category.LeftPwm.description: .blue,
                                        PwmAndBrightness.Category.RightPwm.description: .red,
                                        PwmAndBrightness.Category.Brightness.description: .black,
                                       ])
            .padding()

            HStack {
                Spacer()
                Toggle("Left PWM", isOn: $showLeftPwm)
                    .frame(width: 150)
                Spacer()
                Toggle("Right PWM", isOn: $showRightPwm)
                    .frame(width: 150)
                Spacer()
                Toggle("Brightness", isOn: $showBrightness)
                    .frame(width: 150)
                Spacer()
            } // HStack

            Button {
                viewModel.loadPwmAndBrightness()
            } label: {
                Text("Show Chart")
            }
        } // VStack
    } // var body
}

struct LogChartView_Previews: PreviewProvider {
    static var previews: some View {
        LogChartView()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
