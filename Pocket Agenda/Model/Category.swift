//
//  Category.swift
//  Pocket Agenda
//
//  Created by Admin on 9/30/20.
//  Copyright © 2020 Holmes Org. All rights reserved.
//

import Foundation
import RealmSwift
import ChameleonFramework

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
    @objc dynamic var colour : String = ""
}
