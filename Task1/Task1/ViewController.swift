//
//  ViewController.swift
//  Task1
//
//  Created by Apple on 20/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var mage: UIImageView!
    
    private let sections = MockData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
   //     mage.image = UIImage(named: "popular-1")
        mage.layer.masksToBounds = true
            mage.layer.cornerRadius = mage.frame.height/2
        mage.layer.borderColor = UIColor.blue.cgColor
        mage.layer.borderWidth = 2
        
       
        
        collectionView.collectionViewLayout = createLayout()
        
    }
        
    private func createLayout() -> UICollectionViewCompositionalLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            
            switch section {
                
           
            
            case .top(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(350), heightDimension: .absolute(180)), subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.interGroupSpacing = 23
                section.contentInsets = .init(top: 0, leading: 18, bottom: 0, trailing: 15 )
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
                
            case .middle(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension:.absolute(150)), subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 20
                section.contentInsets = .init(top: 0, leading: 18, bottom: 0, trailing: 15 )
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
               
                return section
                
                
            case .bottom(_):
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(120), heightDimension: .absolute(200)), subitems:[item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 20
                section.contentInsets = .init(top: 0, leading: 18, bottom: 0, trailing: 15 )
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
            
            }
            
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem{
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}


extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return sections[section].itemCount
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sections[indexPath.section]{
        case .top(let topItems):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
            cell.setUpTop(topItems[indexPath.row])
            
            return cell
            
        case .middle(let middleItems):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MiddleCollectionViewCell", for: indexPath) as! MiddleCollectionViewCell
            cell.setUpMiddle(middleItems[indexPath.row])
            
            return cell
            
        case .bottom(let bottomItem):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BottomCollectionViewCell", for: indexPath) as! BottomCollectionViewCell
            cell.setUpBottom(bottomItem[indexPath.row])
            
            return cell
        }

    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionHeaderReusableView", for: indexPath) as! CollectionHeaderReusableView
            header.setUpTitle(sections[indexPath.section].title)
            
            return header
        default:
            return UICollectionReusableView()
        }
    
    }
    
    
  
}
