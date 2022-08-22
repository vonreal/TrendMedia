//
//  ShoppingModel.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/08/22.
//

import Foundation

import RealmSwift

class UserShoppingList: Object {
    @Persisted var todo: String
    @Persisted var bookMark: Bool
    @Persisted var done: Bool
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(todo: String, bookmark: Bool, done: Bool) {
        self.init()
        self.todo = todo
        self.bookMark = bookmark
        self.done = done
    }
}

