//
//  ListingRouter.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import UIKit

protocol ListingRouterProtocol: AnyObject {
    static func createListingModule() -> UIViewController
    func presentDetailsScreen(from view: ListingViewProtocol, with university: University)
}

class ListingRouter: ListingRouterProtocol {
    static func createListingModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Listing", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ListingViewController") as! ListingViewController
        let presenter: ListingPresenterProtocol & ListingInteractorOutputProtocol = ListingPresenter()
        let interactor: ListingInteractorInputProtocol = ListingInteractor()
        let router: ListingRouterProtocol = ListingRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
    
    func presentDetailsScreen(from view: ListingViewProtocol, with university: University) {
        let detailsVC = DetailsRouter.createDetailsModule(with: university)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}
