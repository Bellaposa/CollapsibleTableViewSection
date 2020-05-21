
import Foundation

struct MockData: Codable {
	let datas: [Datas]
	
	enum CodingKeys: String, CodingKey {
		case datas = "datas"
	}
}


// MARK: - Data
struct Datas: Codable {
	let name: String
	let details: String
	
	enum CodingKeys: String, CodingKey {
		case name = "name"
		case details = "details"
	}
}

// Data from file
public func dataFromFile() -> Data? {
	@objc class MockClass: NSObject {}
	
	let bundle = Bundle(for: MockClass.self)
	if let path = bundle.path(forResource: "Mock", ofType: "json") {
		return (try? Data(contentsOf: URL(fileURLWithPath: path)))
	}
	return nil
}
