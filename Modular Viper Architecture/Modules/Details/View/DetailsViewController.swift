//
//  DetailsViewController.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import UIKit

protocol DetailsViewProtocol: AnyObject {
    var presenter: DetailsPresenterProtocol? { get set }
    func showUniversityDetails(_ university: University)
}

class DetailsViewController: UIViewController, DetailsViewProtocol {
    @IBOutlet weak var nameLabel: UILabel!
    
    var presenter: DetailsPresenterProtocol?
    var university: University?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let university = university {
            showUniversityDetails(university)
        }
    }
    
    func showUniversityDetails(_ university: University) {
        nameLabel.text = university.name
    }
}
