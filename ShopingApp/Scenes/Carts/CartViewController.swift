//
//  CartViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import UIKit

private enum Section {
    case main
}
private typealias DataSource = UITableViewDiffableDataSource<Section, CartItemViewModel>
private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, CartItemViewModel>

class CartViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: ViewToPresenterCartProtocol?
    
    private var dataSource: DataSource!
    private var snapshot: Snapshot!
    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar(title: "Cart")
        tableView.register(UINib(nibName: CartItemCell.id, bundle: .main), forCellReuseIdentifier: CartItemCell.id)
        tableView.delegate = self
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadCarts()
    }
    
    
    @IBAction func completeBtnTapped(_ sender: Any) {
    }
    
    private func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, cartItemVM in
            let cell = tableView.dequeueReusableCell(withIdentifier: CartItemCell.id, for: indexPath) as! CartItemCell
            self?.presenter?.configureCell(cell: cell, at: indexPath)
            cell.delegate = self
            return cell
        })
    }
    
    private func applySnapshot(vms: [CartItemViewModel]) {
        snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(vms, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension CartViewController: CartItemCellDeletgate {
    func plusTapped(at indexPath: IndexPath) {
        presenter?.updateCartItem(at: indexPath.row, by: .plus)
    }
    
    func minusTapped(at indexPath: IndexPath) {
        presenter?.updateCartItem(at: indexPath.row, by: .minus)
    }
    
    func deleteTapped(at indexPath: IndexPath) {
        presenter?.deleteCartItem(at: indexPath.row)
    }
    
    
}

extension CartViewController: PresenterToViewCartProtocol{
    // TODO: Implement View Output Methods
    func updateViewData(vms: [CartItemViewModel], total: String) {
        DispatchQueue.main.async { [weak self] in
            self?.applySnapshot(vms: vms)
            self?.totalLbl.text = total
        }
    }
    
    func updateCartItem(vm: CartItemViewModel, total: String) {
        var snap = dataSource.snapshot()
        snap.reloadItems([vm])
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.apply(snap)
            self?.totalLbl.text = total
        }
    }
    
    func deleteCardItem(vms: [CartItemViewModel], total: String) {
        DispatchQueue.main.async { [weak self] in
            self?.applySnapshot(vms: vms)
            self?.totalLbl.text = total
        }
    }
    
    
}
