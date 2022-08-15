//
//  HomeViewController.swift
//  ShopingApp
//
//  Created by Ahmed on 11/08/2022.
//  
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!
    // MARK: - Properties
    var presenter: (ViewToPresenterHomeProtocol & ProductCollectionViewCellDelegate)?
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    var dataSource: DataSource!
    var snapshot: SnapShot!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioView.register(UINib(nibName: ProductCollectionViewCell.id, bundle: .main), forCellWithReuseIdentifier: ProductCollectionViewCell.id)
        collectioView.register(UINib(nibName: BannerCollectionViewCell.id, bundle: .main), forCellWithReuseIdentifier: BannerCollectionViewCell.id)
        collectioView.delegate = self
        collectioView.collectionViewLayout = creatCompositionalLayout()
        configureDataSource()
        setupNavBar(title: "SHOPING")
        let barBtn = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        barBtn.tintColor = .white
        navigationItem.rightBarButtonItem = barBtn
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewDidLoad()
    }
    
    fileprivate func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectioView) { collectionView, indexPath, model in
            
            if model is BannerViewModel {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.id, for: indexPath) as! BannerCollectionViewCell
                self.presenter?.configureBannerCell(cell: cell, indexPath: indexPath)
                return cell
            } else if model is ProductViewModel {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.id, for: indexPath) as! ProductCollectionViewCell
                self.presenter?.configureProductCell(cell: cell, indexPath: indexPath)
                cell.delegate = self.presenter
                return cell
            } else {
                return UICollectionViewCell()
            }
        }
    }
    
    fileprivate func applySnapshot(bannerSection: [BannerViewModel], productSection: [ProductViewModel]) {
        snapshot = SnapShot()
        snapshot.appendSections([.banner, .products])
        snapshot.appendItems(bannerSection, toSection: .banner)
        snapshot.appendItems(productSection, toSection: .products)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func creatCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, environment in
            let section = Section.allCases[sectionIndex]
            switch section {
            case .banner:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                return section
            case .products:
                // item
                let itemLayout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemLayout)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                // group
                let groupLayout = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(300))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayout, subitem: item, count: 2)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                return section
            }
            
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numberOfProducts ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.id, for: indexPath) as! ProductCollectionViewCell
        self.presenter?.configureProductCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
    
}

extension HomeViewController: PresenterToViewHomeProtocol {
    // TODO: Implement View Output Methods
    
    func productsSuccessLoaded(bannerVMs: [BannerViewModel], productVMs: [ProductViewModel]) {
        DispatchQueue.main.async { [unowned self] in
            applySnapshot(bannerSection: bannerVMs, productSection: productVMs)
        }
    }
    
    func productFailuerLoading(message: String? = nil) {
        ProgressHUD.showError(message)
    }
    
    func updateProductCell(productVM: ProductViewModel) {
        var snp = dataSource.snapshot()
        snp.reloadItems([productVM])
        DispatchQueue.main.async { [unowned self] in
            dataSource.apply(snp)
        }
    }
    
    
    
}

extension HomeViewController {
    
    enum Section: CaseIterable {
        case banner
        case products
    }
}
