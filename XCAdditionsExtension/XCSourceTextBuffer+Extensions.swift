//
//  XCSourceTextBuffer+Extensions.swift
//  XCAdditionsExtension
//
//  Created by 和泉田 領一 on 2021/06/16.
//

import Foundation
import XcodeKit

extension XCSourceTextBuffer {
    var selectionRanges: [XCSourceTextRange] {
        selections.compactMap { $0 as? XCSourceTextRange }
    }
    
    var firstSelectionRange: XCSourceTextRange? {
        selectionRanges.sorted { $0.start.line < $1.start.line }.first
    }
    
    func firstLine(for range: XCSourceTextRange) -> String {
        assert(range.start.line < lines.count)
        return lines[range.start.line] as! String
    }
    
    func removeSelections() {
        selections.removeAllObjects()
    }
    
    func addSelection(_ selection: XCSourceTextRange) {
        selections.add(selection)
    }
}
