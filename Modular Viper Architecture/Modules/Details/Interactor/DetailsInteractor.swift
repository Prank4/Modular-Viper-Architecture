//
//  DetailsInteractor.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import Foundation

protocol DetailsInteractorInputProtocol: AnyObject {
    var presenter: DetailsInteractorOutputProtocol? { get set }
}

protocol DetailsInteractorOutputProtocol: AnyObject {
}

class DetailsInteractor: DetailsInteractorInputProtocol {
    var presenter: DetailsInteractorOutputProtocol?
}
