//
//  XCSourceTextPosition+Extensions.swift
//  XCAdditionsExtension
//
//  Created byRyoichi Izumita on 2021/06/16.
//

import Foundation
import XcodeKit

extension XCSourceTextPosition {
    var isHead: Bool {
        column == 0
    }
}
