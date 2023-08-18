import Foundation

/// 走行体へファイルの送信を行う
class FileSendViewModel {
    /// サンプルのCSVファイルを送信する
    func SendSampleFile() async -> String {
        let transmissionManager = TransmissionManager()
        let fileName = "PID.csv"
        let content = CsvFileManager.generateSampleFile()

        do {
            let response = try await transmissionManager.sendFile(to: .First, fileName: fileName, content: content)
            let responseString = "Response from server:\n\(response)"
            print(responseString)
            return responseString
        } catch {
            let errorString = "Error:\n\(error)"
            print(errorString)
            return errorString
        }
    } // func SendSampleFile

    func sendCsvFile(_ csvString: String) async -> String {
        let transmissionManager = TransmissionManager()
        let fileName = "PID.csv"
        let content = CsvFileManager.generateSampleFile()

        do {
            let response = try await transmissionManager.sendFile(to: .First, fileName: fileName, content: csvString)
            let responseString = "Response from server:\n\(response)"
            print(responseString)
            return responseString
        } catch {
            let errorString = "Error:\n\(error)"
            print(errorString)
            return errorString
        }
    } // func SendSampleFile
} // FileSendViewModel
