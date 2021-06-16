//
//  MoveToHomeCommand.swift
//  XCAdditionsExtension
//
//  Created by Ryoichi Izumita on 2021/06/16.
//

import Foundation
import XcodeKit

class MoveToHomeCommand: NSObject, XCSourceEditorCommand, CommandDefinable {
    static let commandName = "Move to Home"
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        let buffer = invocation.buffer
        
        if let range = buffer.firstSelectionRange {
            buffer.removeSelections()

            let line = Line(lineString: buffer.firstLine(for: range), number: range.start.line)
            let position = cursorPosition(range: range, line: line)
            let head = head(from: position)
            let textPosition = headPosition(head: head, line: line)
            let homeRange = XCSourceTextRange(start: textPosition, end: textPosition)
            buffer.selections[0] = homeRange
        }
        
        completionHandler(nil)
    }
}

private struct Line {
    let lineString: String
    let number: Int
    
    var indentLength: Int {
        lineString.prefix { $0.isWhitespace }.count
    }
}

private enum CursorPosition {
    case onLineHead
    case inIndent
    case onWordHead
    case inWord
}

private enum Head {
    case lineHead
    case wordHead
}

private func cursorPosition(range: XCSourceTextRange, line: Line) -> CursorPosition {
    if range.start.column == 0 {
        return .onLineHead
    } else if range.start.column < line.indentLength {
        return .inIndent
    } else if range.start.column == line.indentLength {
        return .onWordHead
    } else {
        return .inWord
    }
}

private func head(from position: CursorPosition) -> Head {
    switch position {
    case .onLineHead, .inWord:
        return .wordHead
    case .inIndent, .onWordHead:
        return .lineHead
    }
}

private func headPosition(head: Head, line: Line) -> XCSourceTextPosition {
    switch head {
    case .lineHead:
        return XCSourceTextPosition(line: line.number, column: 0)
    case .wordHead:
        return XCSourceTextPosition(line: line.number, column: line.indentLength)
    }
}
