import Foundation

/// CSVファイルに関する処理を行う
struct CsvFileManager {
    /// サンプルファイルを生成して返す
    static func generateSampleFile() -> String {
        let array = [["P", "I", "D"], ["1", "2", "3"], ["10", "20", "30"], ["100", "200", "300"]]
        let csvString = array.map { $0.joined(separator: ",") }.joined(separator: "\n")
        return csvString
    }
}
