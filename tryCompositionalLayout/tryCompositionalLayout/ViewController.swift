//
//  ViewController.swift
//  tryCompositionalLayout
//
//  Created by 佐藤俊輔 on 2022/12/08.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section: CaseIterable{
        case items
        case loading
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var allFetched = false
    fileprivate var fetching = false
    fileprivate var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex: Int, _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // setup Item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0 / 3.0 - 0.001),
                heightDimension: NSCollectionLayoutDimension.estimated(44)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // setup Group
            let itemCount: Int
            switch sectionIndex {
            case 0: itemCount = 3 // item
            case 1: itemCount = 1 // loading
            default: fatalError()
            }
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0),
                heightDimension: NSCollectionLayoutDimension.estimated(44)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: itemCount)
            group.interItemSpacing = .fixed(24)
            group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
            
            // setup Section
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 24
            return section
        }
    }
    
    fileprivate func fetch() async -> [String] {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        return [Int](0..<15).map { _ in "\(Int.random(in: 0..<10000))" }
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
            if fetching { return }
            
            Task {
                self.fetching = true
                self.items.append(contentsOf: await fetch())
                self.collectionView.reloadData()
                self.fetching = false
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return items.count
        case 1:
            return 1
        default: fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        switch section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loadingCell", for: indexPath)
            return cell
        default: fatalError()
        }
    }
}

class ItemCell: UICollectionViewCell {
    
}

class LoadingCell: UICollectionViewCell {
    
}

struct SomeViewModel {
    
    func fetchSome() async -> String {
        "\(Int.random(in: 0..<10000))"
    }
}
