//
//  File.swift
//  
//
//  Created byRyoichi Izumita on 2021/06/17.
//

import Foundation
import XCTest
@testable import MoveToHome

class MoveToHomeTypesTests: XCTestCase {
    func testLine_indentLength() throws {
        XCTContext.runActivity(named: "indentLength") { _ in
            let strings = [
                ("", 0),
                (" ", 1),
                ("          ", 10),
                (" a", 1),
                (" a ", 1),
                ("a", 0),
                ("a ", 0),
            ]

            strings.forEach { string, indentLength in
                let line = Line(lineString: string, number: 1)
                XCTAssertEqual(line.indentLength, indentLength)
            }
        }
    }

    func testCursorPositionClassification() throws {
        XCTContext.runActivity(named: "cursorPositionClassification") { _ in
            let args: [(CursorPosition, Line, CursorPositionClassification)] = [
                ((CursorPosition(lineNumber: 1, column: 0)), Line(lineString: "", number: 1), .onLineHead),
            ]

            args.forEach { cursorPosition, line, expect in
                return XCTAssertEqual(.cursorPositionClassification(cursorPosition: cursorPosition, line: line), expect)
            }
        }
    }
}
