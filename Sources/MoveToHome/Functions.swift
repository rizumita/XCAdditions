//
//  Created byRyoichi Izumita on 2021/06/17.
//

import Foundation

public typealias Position = (line: Int, column: Int)

public func homePosition<T>(cursorPosition: CursorPosition, line: Line, _ initialize: (Position) -> T) -> T {
    let cursorPositionClassification
        = CursorPositionClassification.cursorPositionClassification(cursorPosition: cursorPosition, line: line)
    let homeType = HomeType.homeType(positionClassification: cursorPositionClassification)
    let homePosition = position(homeType: homeType, line: line)
    return initialize(homePosition)
}

func position(homeType: HomeType, line: Line) -> Position {
    switch homeType {
    case .lineHome:
        return (line: line.number, column: 0)
    case .wordHome:
        return (line: line.number, column: line.indentLength)
    }
}
