//
//  StorageHandler.swift
//  
//
//  Created by Евгений Кириллов on 03.09.2021.
//

import RealmSwift

public struct StorageHandler {
    
    let realm: Realm
    
    init() throws {
        realm = try Realm()
    }
    
    public func persistObject(_ object: Object) throws {
        try realm.write(object)
    }
    
}
