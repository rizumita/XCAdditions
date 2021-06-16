//
//  CommandDefinable.swift
//  XCAdditionsExtension
//
//  Created by 和泉田 領一 on 2021/06/16.
//

import Foundation

protocol CommandDefinable: NSObject {
    static var commandName: String { get }
}
