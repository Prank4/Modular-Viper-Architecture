//
//  RealmManager.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private let realm = try! Realm()
    
    func saveUniversities(_ universities: [University]) {
        DispatchQueue.main.async {
            try! self.realm.write {
                self.realm.add(universities, update: .modified)
            }
        }
    }
    
    func fetchUniversities() -> [University] {
        let universities = realm.objects(University.self)
        return Array(universities)
    }
}
