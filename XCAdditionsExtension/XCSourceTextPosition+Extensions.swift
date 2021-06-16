//
//  XCSourceTextPosition+Extensions.swift
//  XCAdditionsExtension
//
//  Created by 和泉田 領一 on 2021/06/16.
//

import Foundation
import XcodeKit

extension XCSourceTextPosition {
    var isHead: Bool {
        column == 0
    }
}
