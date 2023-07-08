import Foundation

/// Secret.plistから走行体のIPアドレスを取得する
struct MachineTransmissionInfo {
    var properties: [String: Any] = [:]
    let firstMachine: String
    let secondMachine: String
    let port: String

    init() {
        guard let plistPath = Bundle.main.path(forResource: "Secret", ofType: "plist") else {
            fatalError("Secret.plist not found.")
        }
        let configurations = NSDictionary(contentsOfFile: plistPath)

        guard let data = configurations as? [String: Any] else {
            fatalError("Cannot convert configurations to [String: Any].")
        }
        properties = data

        guard let firstMachineIpAddress = properties["FirstMachineIpAddress"] as? String else {
            fatalError("Cannot convert firstMachineIpAddress to String.")
        }
        firstMachine = firstMachineIpAddress

        guard let secondMachineIpAddress = properties["SecondMachineIpAddress"] as? String else {
            fatalError("Cannot convert secondMachineIpAddress to String.")
        }
        secondMachine = secondMachineIpAddress

        guard let portNumber = properties["PortNumber"] as? String else {
            fatalError("Cannot convert PortNumber to String.")
        }
        port = portNumber
    } // init()
} // struct IpAddress
