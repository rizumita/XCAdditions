//
//  CommandDefinable.swift
//  XCAdditionsExtension
//
//  Created byRyoichi Izumita on 2021/06/16.
//

import Foundation

protocol CommandDefinable: NSObject {
    static var commandName: String { get }
}
