import Foundation

/// 走行体へファイルの送信を行う
class FileSendViewModel {
    /// サンプルのCSVファイルを送信する
    func SendSampleFile() {
        let transmissionManager = TransmissionManager()
        let fileName = "PID.csv"
        let content = CsvFileManager.generateSampleFile()

        Task {
            do {
                let response = try await transmissionManager.sendFile(to: .First, fileName: fileName, content: content)
                print("Response from server: \(response)")
            } catch {
                print("Error: \(error)")
            }
        } // Task
    } // func SendSampleFile
} // FileSendViewModel
