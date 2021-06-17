//
//  Created by Ryoichi Izumita on 2021/06/18.
//

import Foundation
@_exported import Base

public func newLine(line: Line) -> Line {
    Line(lineString: line.indent, number: line.number + 1)
}
