//
//  CategoryViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 14/08/2022.
//  
//

import UIKit

fileprivate enum Section {
    case main
}

fileprivate typealias DataSource = UICollectionViewDiffableDataSource<Section, CategoryViewModel>
fileprivate typealias Snapshot = NSDiffableDataSourceSnapshot<Section, CategoryViewModel>

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var presenter: ViewToPresenterCategoryProtocol?
    
    private var dataSource: DataSource!
    private var snapshot: Snapshot!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.register(UINib(nibName: CategoryCell.id, bundle: .main), forCellWithReuseIdentifier: CategoryCell.id)
        collectionView.collectionViewLayout = creatCompositionalLayout()
        configureDataSource()
        
        navigationItem.title = "Categories".capitalized
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
        let barBtn = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        barBtn.tintColor = .white
        navigationItem.rightBarButtonItem = barBtn
        self.navigationController?.navigationBar.barTintColor = view.tintColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.getCategories()
    }
    
    private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let padding: CGFloat = 5
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: padding, leading: padding, bottom: padding, trailing: padding)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        return UICollectionViewCompositionalLayout(section: section)
    }

    private func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, categoryVM in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.id, for: indexPath) as! CategoryCell
            self?.presenter?.configure(cell: cell, at: indexPath)
            return cell
        })
    }
    
    private func applySnapshot(vms: [CategoryViewModel]) {
        snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(vms, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

extension CategoryViewController: UICollectionViewDelegate {
    
}

extension CategoryViewController: PresenterToViewCategoryProtocol{
    // TODO: Implement View Output Methods
    func reloadCategories(with categoryVMs: [CategoryViewModel]) {
        applySnapshot(vms: categoryVMs)
    }
}
