//
//  TranslatableManagerType.swift
//  TranslationManager
//
//  Created by Dominik Hadl on 18/10/2018.
//  Copyright © 2018 Nodes. All rights reserved.
//

import Foundation

public protocol TranslatableManagerType: class {
//    associatedtype L: LanguageModel
    
    var updateMode: UpdateMode { get }
    
    var decoder: JSONDecoder { get }
    var encoder: JSONEncoder { get }
    
    var currentLanguage: LanguageModel? { get }
    var acceptLanguage: String { get }
    
    func translation(for keyPath: String) throws -> String?
    func translations<T: Translatable>() throws -> T
    
    func updateTranslations(_ completion: ((_ error: Error?) -> Void)?)
    func fetchAvailableLanguages<L>(_ completion: @escaping (Result<[L]>) -> Void) where L: LanguageModel
    
    func set<L>(languageOverride language: L?) throws where L: LanguageModel
    func clearTranslations(includingPersisted: Bool) throws
}
