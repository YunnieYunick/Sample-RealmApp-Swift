//
//  RealmSwift.swift
//  Sample-RealmApp-Swift
//
//  Created by Yunnie Yunick on 2017/01/22.
//  Copyright © 2017年 yunnieyunick. All rights reserved.
//

import Foundation
import RealmSwift

class Sample: Object {
    
        dynamic var name = ""
        dynamic var score = 0

    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
