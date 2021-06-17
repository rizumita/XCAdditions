//
//  SourceEditorExtension.swift
//  XCAdditionsExtension
//
//  Created byRyoichi Izumita on 2021/06/16.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {

    /*
    func extensionDidFinishLaunching() {
        // If your extension needs to do any work at launch, implement this optional method.
    }
    */
    
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        return [
            makeDefinitions(MoveToHomeCommand.self),
        ]
    }

    private func makeDefinitions<Def: CommandDefinable>(_ def: Def.Type) -> [XCSourceEditorCommandDefinitionKey: Any] {
        guard let bundleId = Bundle(for: type(of: self)).bundleIdentifier else { return [:] }

        return [
            XCSourceEditorCommandDefinitionKey.identifierKey: bundleId + def.className(),
            XCSourceEditorCommandDefinitionKey.classNameKey: def.className(),
            XCSourceEditorCommandDefinitionKey.nameKey: def.commandName
        ]
    }

}
