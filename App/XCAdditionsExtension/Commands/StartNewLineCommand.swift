//
// Created by Ryoichi Izumita on 2021/06/18.
//

import Foundation
import XcodeKit
import StartNewLine

class StartNewLineCommand: NSObject, XCSourceEditorCommand, CommandDefinable {
    static let commandName = "Start New Line"

    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> ()) {
        let buffer = invocation.buffer

        if let range = buffer.firstSelectionRange {
            let line = Line(lineString: buffer.endLine(for: range), number: range.end.line)
            let nextLine = newLine(line: line)
            buffer.lines.insert(nextLine.lineString, at: nextLine.number)
            buffer.selections.removeAllObjects()
            let position = XCSourceTextPosition(line: nextLine.number, column: nextLine.indentLength)
            buffer.selections.add(XCSourceTextRange(start: position, end: position))
        }

        completionHandler(nil)
    }
}
