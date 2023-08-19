import Foundation

class LogChartViewModel: ObservableObject {
    @Published var pwmAndBrightness: [pwmAndBrightness] = []

    func loadPwmAndBrightness() {
        let converter = logTextToPwmAndBrightnessConverter()
        let chartData = converter.logTextToPwmAndBrightness(with: converter.sampleData)
        pwmAndBrightness = chartData
    }
}
