//
//  University.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import Foundation
import RealmSwift

class University: Object, Decodable {
    @objc dynamic var name: String = ""
    @objc dynamic var country: String = ""
    
    override static func primaryKey() -> String? {
        return "name"
    }
}
