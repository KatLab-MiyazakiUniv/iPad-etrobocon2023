import Foundation

class LogChartViewModel: ObservableObject {
    @Published var pwmAndBrightness: [PwmAndBrightness] = []

    func loadPwmAndBrightness() {
        let converter = logTextToPwmAndBrightnessConverter()
        let chartData = converter.logTextToPwmAndBrightness(with: converter.sampleData)
        pwmAndBrightness = chartData
    }
}
