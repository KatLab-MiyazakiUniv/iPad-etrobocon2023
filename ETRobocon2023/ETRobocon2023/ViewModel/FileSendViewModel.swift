import Foundation

/// 走行体へファイルの送信を行う
class FileSendViewModel {
    func sendCsvFile(with csvString: String, courseSide: CourseSideEnum, section: SelectedCommandSectionEnum) async -> String {
        let transmissionManager = TransmissionManager()
        var fileName: String {
            switch courseSide {
            case .LeftCourse:
                switch section {
                case .FromStartToDoubleLoop: return FileNameEnum.LineTraceLeft.name
                case .FromAreaAToAreaB: return "BlockDeTreasureRight-Left.csv"
                case .AreaB: return "AreaB-Left.csv"
                case .AreaABottom: return "AreaABottom-Left.csv"
                }
            case .RightCourse:
                switch section {
                case .FromStartToDoubleLoop: return FileNameEnum.LineTraceRight.name
                case .FromAreaAToAreaB: return "FromAreaAToAreaB-Right.csv"
                case .AreaB: return "AreaB-Right.csv"
                case .AreaABottom: return "AreaABottom-Right.csv"
                }
            }
        } // var fileName


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
