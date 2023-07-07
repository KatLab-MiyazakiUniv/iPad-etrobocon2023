import Foundation

/// Secret.plistから走行体のIPアドレスを取得する
struct IpAddress {
    var properties: [String: Any] = [:]
    let firstMachine: String
    let secondMachine: String

    init() {
        guard let plistPath = Bundle.main.path(forResource: "Secret", ofType: "plist") else {
            fatalError("Secret.plist not found.")
        }
        let configurations = NSDictionary(contentsOfFile: plistPath)

        guard let data = configurations as? [String: Any] else {
            fatalError("Cannot convert configurations to [String: Any].")
        }
        properties = data

        guard let firstMachineIpAddress = properties["firstMachineIpAddress"] as? String else {
            fatalError("Cannot convert firstMachineIpAddress to String.")
        }
        firstMachine = firstMachineIpAddress

        guard let secondMachineIpAddress = properties["secondMachineIpAddress"] as? String else {
            fatalError("Cannot convert secondMachineIpAddress to String.")
        }
        secondMachine = secondMachineIpAddress
    } // init()
} // struct IpAddress
