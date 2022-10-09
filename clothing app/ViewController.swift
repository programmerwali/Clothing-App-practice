//
//  ViewController.swift
//  clothing app
//
//  Created by Wali Faisal on 01/10/2022.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    

    
    
    
    @IBOutlet weak var sideview: UIView!
    
    
    @IBOutlet weak var sidebar: UITableView!
    
    var isSideViewOpen: Bool = false
    
    
    
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    

    
    
    
    var categoryImages: [String] = ["clothing", "accesories-2", "shoes" , "watches", "bags" ]
    var categoryLabel: [String] = ["CLOTHING", "ACCESSORIES", "SHOES" , "WATCHES", "BAGS" ]
    
    
    var secondImages: [String] = ["jacket1", "jacket2", "jacket3" , "jacket4", "jacket5" ]
    var secondLabel: [String]  = ["BOSS MODE BLAZER", "DOUBLE-FACED FAUX" ,"DOUBLE-FACED JACKET ","HOODED TECHNICAL JACKET","DENIM JACKET WITH FAUX"]
    
    var secondPrice: [String] = ["$49.99", "$37.45", "$100.00", "$50.00", "$499.99"]
    
    var thirdImages: [String] = ["featured1", "featured2", "featured3" , "featured4", "featured5" ]
    
    var thirdLabel: [String]  = ["Breeze Blazer", "Hood Jacket" ,"Trench Coat","Rip Blazer ","Cargo Fleece"]
    
    var thirdPrice: [String] = ["$99.99", "$33.95", "$200.00", "$15.00", "$25.99"]
    
    
    var arrdata: [String] = ["HOME", "SHOP", "BAG", "SEARCH", "ORDERS", "WISHLIST", "PROFILE", "LOGOUT"]
    
    var arrimage: [String] =  ["home50", "icons8-shop-50" , "icons8-shopping-bag-50", "icons8-search-50", "icons8-van-50" ,"icons8-heart-50", "icons8-administrator-male-50", "icons8-logout-rounded-down-50"]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "tablecell") as! TableViewCell
        
        cell.sidebarimage.image = UIImage(named: arrimage[indexPath.row])
        cell.sidebarlabel.text = arrdata[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1
        {
            let shopscreen:shopViewController = self.storyboard?.instantiateViewController(withIdentifier: "shopscreen") as! shopViewController
            
            self.navigationController?.pushViewController(shopscreen, animated: true)
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // configureItems()

        sideview.isHidden = true
        //sidebar.backgroundColor = UIColor.groupTableViewBackground
        isSideViewOpen = false
        
    }
    
    
    
    @IBAction func btnmenu(_ sender: UIButton) {
        
        
        sidebar.isHidden = false
        sideview.isHidden = false
        self.view.bringSubviewToFront(sideview)
        if !isSideViewOpen{
            
            isSideViewOpen = true
            sideview.frame = CGRect(x: 0, y: 0, width: 0, height: 730)
            sidebar.frame = CGRect(x: 0, y: 0, width: 0, height: 730)
            
            sideview.frame = CGRect(x: 0, y: 0, width: 321, height: 730)
            sidebar.frame = CGRect(x: 0, y: 0, width: 321, height: 730)
        }
        else
        {
            
            sidebar.isHidden = true
            sideview.isHidden = true
            isSideViewOpen = false
            sideview.frame = CGRect(x: 0, y: 0, width: 321, height: 730)
            sidebar.frame = CGRect(x: 0, y: 0, width: 321, height: 730)
            
            sideview.frame = CGRect(x: 0, y: 0, width: 0, height: 730)
            sidebar.frame = CGRect(x: 0, y: 0,  width: 0, height: 730)
        }
        
        
    }
    
    
    
    
//    private func configureItems()
//    {
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//
//            image: UIImage(systemName: "cart"),
//            style: .plain,
//            target: self,
//            action: nil
//        )
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//
//            image: UIImage(systemName: "line.3.horizontal"),
//            style: .plain,
//            target: self,
//            action: nil
//        )
//    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.firstCollectionView
        {
            return categoryImages.count
        }
                
        else if collectionView == self.secondCollectionView
        {
            return secondImages.count
        }
        
        else
        {
            return thirdImages.count
        }
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell
        
        if collectionView == self.firstCollectionView
        {
            cell.myCategoryImage.image = UIImage(named: categoryImages[indexPath.row])
            cell.myCategoryImage.layer.cornerRadius = 25.0
            cell.myCategoryLabel.text = categoryLabel[indexPath.row]
        }
    
        else if collectionView == self.secondCollectionView
        {
            cell.myCategoryImage.image = UIImage(named: secondImages[indexPath.row])
            cell.myCategoryImage.layer.cornerRadius = 10.0
            
            cell.myClothingLabel.text = secondLabel[indexPath.row]
            cell.myClothingPrice.text = secondPrice[indexPath.row]
            
        }
        
        else
        {
            cell.myThirdClothingImage.image = UIImage(named: thirdImages[indexPath.row])
            cell.myThirdClothingImage.layer.cornerRadius = 10.0
            
            cell.myThirdClothingName.text = thirdLabel[indexPath.row]
            cell.myThirdClothingPrice.text = thirdPrice[indexPath.row]
        }
        
       return cell
    }

}








