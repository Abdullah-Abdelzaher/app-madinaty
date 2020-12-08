//
//  HomePage.swift
//  Madinaty
//
//  Created by Abdullah on 11/21/20.
//

import UIKit

class HomePage: UIViewController {
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var collectionV: UICollectionView!
    @IBOutlet weak var famousePlacesInAreaLb: UILabel!
    @IBOutlet weak var famousPlacesCollectionView: UICollectionView!
    @IBOutlet weak var subcategoriesIAreaLb: UILabel!
    @IBOutlet weak var subcategoriesCollectionView: UICollectionView!
    @IBOutlet weak var subcateagoriesCollectionHeight: NSLayoutConstraint!
    
    let searchImg = UIImage(named: "Search")
    var sliderImages = [HomeDataFields]()
    var categories = [HomeDataFields]()
    var subCategories = [HomeDataFields]()
    var famousPlaces = [HomeDataFields]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionV.delegate = self
        collectionV.dataSource = self
        famousPlacesCollectionView.delegate = self
        famousPlacesCollectionView.dataSource = self
        subcategoriesCollectionView.delegate = self
        subcategoriesCollectionView.dataSource = self
        
        getHomeData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        searchTF.layer.cornerRadius = searchTF.frame.height / 2
        searchTF.clipsToBounds = true
        AddRightImage(textField: searchTF, andImage: searchImg!)
    }
    
    func AddRightImage(textField: UITextField , andImage img: UIImage) {
        
        let rightImageView = UIImageView(frame: CGRect(x: 0.0, y: 50, width: 13.0, height: 13.0))
        rightImageView.image = img
        textField.rightView = rightImageView
        textField.rightViewMode = .always
        
    }

    func getHomeData(){
        HomeApi.getHomeData(areaId: 1) { (dataError, isSuccess, homeData) in
            if let homeData = homeData{
                self.sliderImages = homeData.Slider ?? []
                self.categories = homeData.allCategories ?? []
                self.subCategories = homeData.subcategory ?? []
                self.famousPlaces = homeData.popularSections ?? []
                self.subcategoriesCollectionView.reloadData()
                self.collectionV.reloadData()
                self.famousPlacesCollectionView.reloadData()
                self.subcateagoriesCollectionHeight.constant = self.subcategoriesCollectionView.contentSize.height
            }
        }
    }
}

extension HomePage:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionV{
            return categories.count
        }else if collectionView == famousPlacesCollectionView{
            return famousPlaces.count
        }else{
            return subCategories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionV{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! HomeCategoryCell
            cell.configure(category: categories[indexPath.item])
            return cell
        }else if collectionView == famousPlacesCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "famousPlacesCell", for: indexPath) as! famousPlacesCell
            cell.configure(place: famousPlaces[indexPath.item])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subcategoriesCell", for: indexPath) as! subcategoriesCell
            cell.configure(subCategory: subCategories[indexPath.item])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionV{
            return CGSize(width: 120, height: 40)
        }else if collectionView == famousPlacesCollectionView{
            return CGSize(width: 200, height: 130)
        }else{
            let width = (collectionView.frame.width - 20) / 2
            return CGSize(width: width, height: 100)
        }
    }
}
