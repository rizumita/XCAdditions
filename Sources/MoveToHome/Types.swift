//
//  Created byRyoichi Izumita on 2021/06/17.
//

import Foundation

public struct CursorPosition {
    public init(lineNumber: Int, column: Int) {
        self.lineNumber = lineNumber
        self.column = column
    }

    public let lineNumber: Int
    public let column: Int
}

public enum CursorPositionClassification {
    case onLineHead
    case inIndent
    case onWordHead
    case tail

    static func cursorPositionClassification(cursorPosition: CursorPosition, line: Line) -> CursorPositionClassification {
        assert(cursorPosition.lineNumber == line.number)
        assert(cursorPosition.column <= line.lineString.count)

        if cursorPosition.column == 0 {
            return .onLineHead
        } else if cursorPosition.column < line.indentLength {
            return .inIndent
        } else if cursorPosition.column == line.indentLength {
            return .onWordHead
        } else {
            return .tail
        }
    }
}

public enum HomeType {
    case lineHome
    case wordHome

    static func homeType(positionClassification: CursorPositionClassification) -> HomeType {
        switch positionClassification {
        case .onLineHead, .tail:
            return .wordHome
        case .inIndent, .onWordHead:
            return .lineHome
        }
    }
}
