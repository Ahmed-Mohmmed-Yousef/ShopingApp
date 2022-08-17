//
//  MoreViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 15/08/2022.
//  
//

import UIKit



private enum Section {
    case main
}

private typealias DataSource = UITableViewDiffableDataSource<Section, MoreItemVM>
private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MoreItemVM>

class MoreViewController: UIViewController {
    // MARK: - Properties
    var presenter: ViewToPresenterMoreProtocol?
    private var dataSource: DataSource!
    private var snapshot: Snapshot!
    @IBOutlet weak var tableView: UITableView!
    
    let loginView = LoginHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
    var userInfoHeader: UserInfoHeader!
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar(title: "MORE")
        tableView.register(UINib(nibName: MoreItemCell.id, bundle: .main), forCellReuseIdentifier: MoreItemCell.id)
        tableView.delegate = self
        loginView.delegate = self
        configureDataSource()
        NotificationCenter.default.addObserver(self, selector: #selector(handelNotification), name: .newCredentials, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    
    @objc private func handelNotification() {
        presenter?.handelLoginNotification()
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, cartItemVM in
            let cell = tableView.dequeueReusableCell(withIdentifier: MoreItemCell.id, for: indexPath) as! MoreItemCell
            self?.presenter?.configureCell(cell: cell, at: indexPath)
            return cell
        })
    }
    
    private func applySnapshot(vms: [MoreItemVM]) {
        snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(vms, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension MoreViewController: UITableViewDelegate, LoginHeaderDeletgate {
    func userTapped() {
        presenter?.logonHeaderTapped()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.itemTapped(at: indexPath.row)
    }
}

extension MoreViewController: PresenterToViewMoreProtocol{
    // TODO: Implement View Output Methods
    
    func reloadWith(vms: [MoreItemVM]) {
        applySnapshot(vms: vms)
    }
    
    func updateWith(username: String, image: String) {
        userInfoHeader =  UserInfoHeader(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        tableView.tableHeaderView = userInfoHeader
        userInfoHeader.setupUserInfoHeader(name: username, image: image)
    }
    
    func loginHeader() {
        tableView.tableHeaderView = loginView
    }
    
}
