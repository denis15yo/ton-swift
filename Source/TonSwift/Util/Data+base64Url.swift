import Foundation

extension Data {
    init?(base64Url input: String) {
        var input = input
        
        input = input
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        while input.count % 4 != 0 {
            input.append("=")
        }
        
        self.init(base64Encoded: input)
    }
    
    init?(base64OrBase64Url input: String) {
        if let data = Data(base64Encoded: input) {
            self = data
        } else if let data = Data(base64Url: input) {
            self = data
        } else {
            return nil
        }
    }
}
