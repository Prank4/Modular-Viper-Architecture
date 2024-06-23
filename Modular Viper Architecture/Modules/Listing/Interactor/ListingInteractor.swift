//
//  ListingInteractor.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import Foundation
import RealmSwift

protocol ListingInteractorInputProtocol: AnyObject {
    var presenter: ListingInteractorOutputProtocol? { get set }
    func fetchUniversities()
    func refreshUniversities()
}

protocol ListingInteractorOutputProtocol: AnyObject {
    func didFetchUniversities(_ universities: [University])
    func onError()
}

class ListingInteractor: ListingInteractorInputProtocol {
    weak var presenter: ListingInteractorOutputProtocol?

    func fetchUniversities() {
        let url = URL(string: "https://universities.hipolabs.com/search?country=United%20Arab%20Emirates")!
        
        NetworkManager.shared.fetchData(url: url) { [weak self] result in
            switch result {
            case .success(let universities):
                DispatchQueue.main.async {
                    RealmManager.shared.saveUniversities(universities)
                }
                self?.presenter?.didFetchUniversities(universities)
            case .failure:
                DispatchQueue.main.async {
                    let cachedUniversities = RealmManager.shared.fetchUniversities()
                    if cachedUniversities.isEmpty {
                        self?.presenter?.onError()
                    } else {
                        self?.presenter?.didFetchUniversities(cachedUniversities)
                    }
                }
            }
        }
    }

    func refreshUniversities() {
        fetchUniversities()
    }
}
