//
//  ListingViewController.swift
//  Modular Viper Architecture
//
//  Created by Prankur Kamra on 22/06/24.
//

import UIKit

protocol ListingViewProtocol: AnyObject {
    var presenter: ListingPresenterProtocol? { get set }
    func showUniversities(_ universities: [University])
    func showError()
}

class ListingViewController: UIViewController, ListingViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ListingPresenterProtocol?
    var universities: [University] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    func setupUI() {
        title = "Universities"
        tableView.dataSource = self
        tableView.delegate = self
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonClicked))
        navigationItem.rightBarButtonItem = refreshButton
    }

    @objc func refreshButtonClicked() {
        presenter?.refreshButtonClicked()
    }

    func showUniversities(_ universities: [University]) {
        DispatchQueue.main.async {
            self.universities = universities
            self.tableView.reloadData()
        }
    }

    func showError() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: "Failed to fetch data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}

extension ListingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = universities[indexPath.row].name
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetails(for: universities[indexPath.row])
    }
}
