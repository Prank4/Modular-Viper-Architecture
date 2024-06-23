//
//  DetailsRouter.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import UIKit

protocol DetailsRouterProtocol: AnyObject {
    static func createDetailsModule(with university: University) -> UIViewController
}

class DetailsRouter: DetailsRouterProtocol {
    static func createDetailsModule(with university: University) -> UIViewController {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let presenter: DetailsPresenterProtocol & DetailsInteractorOutputProtocol = DetailsPresenter()
        let interactor: DetailsInteractorInputProtocol = DetailsInteractor()
        let router: DetailsRouterProtocol = DetailsRouter()
        
        view.presenter = presenter
        view.university = university
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
