import SwiftUI
import Charts

struct LogChartView: View {
    @StateObject var viewModel = LogChartViewModel()

    var body: some View {
        VStack {
            Chart {
                ForEach(viewModel.pwmAndBrightness) { pwmAndBrightness in
                    LineMark(x: .value("numberOfSeconds", pwmAndBrightness.numberOfSeconds),
                             y: .value("leftPwm", pwmAndBrightness.leftPwm))
                }
            } // Chart
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
    }
}
