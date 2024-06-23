//
//  DetailsPresenter.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {
    var view: DetailsViewProtocol? { get set }
    var interactor: DetailsInteractorInputProtocol? { get set }
    var router: DetailsRouterProtocol? { get set }
}

class DetailsPresenter: DetailsPresenterProtocol, DetailsInteractorOutputProtocol {
    var view: DetailsViewProtocol?
    var interactor: DetailsInteractorInputProtocol?
    var router: DetailsRouterProtocol?
}
