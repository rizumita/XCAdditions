//
//  MoveToHomeCommand.swift
//  XCAdditionsExtension
//
//  Created by Ryoichi Izumita on 2021/06/16.
//

import Foundation
import XcodeKit
import MoveToHome

class MoveToHomeCommand: NSObject, XCSourceEditorCommand, CommandDefinable {
    static let commandName = "Move to Home"

    func perform(with invocation: XCSourceEditorCommandInvocation,
                 completionHandler: @escaping (Error?) -> Void) -> Void {
        let buffer = invocation.buffer

        if let range = buffer.firstSelectionRange {
            buffer.removeSelections()

            let cursorPosition = CursorPosition(lineNumber: range.start.line, column: range.start.column)
            let line = Line(lineString: buffer.firstLine(for: range), number: range.start.line)
            let textPosition
                = homePosition(cursorPosition: cursorPosition, line: line, XCSourceTextPosition.init(line:column:))
            let homeRange = XCSourceTextRange(start: textPosition, end: textPosition)
            buffer.selections[0] = homeRange
        }

        completionHandler(nil)
    }
}
