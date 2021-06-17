//
//  Created by Ryoichi Izumita on 2021/06/18.
//

import Foundation

public struct Line {
    public let lineString: String
    public let number: Int
    
    public init(lineString: String, number: Int) {
        self.lineString = lineString
        self.number = number
    }
    
    public var indent: String {
        String(lineString.prefix { $0.isWhitespace })
    }
    
    public var indentLength: Int {
        indent.count
    }
}
