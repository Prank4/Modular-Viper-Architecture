//
//  ListingPresenter.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import Foundation

protocol ListingPresenterProtocol: AnyObject {
    var view: ListingViewProtocol? { get set }
    var interactor: ListingInteractorInputProtocol? { get set }
    var router: ListingRouterProtocol? { get set }
    func viewDidLoad()
    func refreshButtonClicked()
    func showDetails(for university: University)
}

class ListingPresenter: ListingPresenterProtocol, ListingInteractorOutputProtocol {
    weak var view: ListingViewProtocol?
    var interactor: ListingInteractorInputProtocol?
    var router: ListingRouterProtocol?

    func viewDidLoad() {
        interactor?.fetchUniversities()
    }

    func refreshButtonClicked() {
        interactor?.refreshUniversities()
    }

    func showDetails(for university: University) {
        router?.presentDetailsScreen(from: view!, with: university)
    }

    func didFetchUniversities(_ universities: [University]) {
        view?.showUniversities(universities)
    }

    func onError() {
        view?.showError()
    }
}
