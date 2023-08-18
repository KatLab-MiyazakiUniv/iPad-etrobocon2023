import Foundation

/// 通信に関する処理を行う
struct TransmissionManager {
    // 文字列にファイル名を付けて，走行体へ送信する
    func sendFile(to whichMachine: WhichMachine, fileName: String, content: String) async throws -> String {
        let machineTransmissionInfo = MachineTransmissionInfo()

        let ipAddress: String
        switch whichMachine {
        case .First:
            ipAddress = machineTransmissionInfo.firstMachine
        case .Second:
            ipAddress = machineTransmissionInfo.secondMachine
        }

        let portNumber = machineTransmissionInfo.port
        let urlString = "http://" + ipAddress + ":" + portNumber + ""

        guard let url = URL(string: urlString) else {
            fatalError("Cannot convert \(urlString) to URL.")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()
//        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//        data.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
//        data.append("Content-Type: text/csv\r\n\r\n".data(using: .utf8)!)
        data.append(content.data(using: .utf8)!)
//        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = data

//        request.httpMethod = "GET"

        let (recievedData, _) = try await URLSession.shared.data(for: request)
        let str = String(data: recievedData, encoding: .utf8)
        return str ?? "No data"
    } // func sendFile
} // TransmissionManager
