//
//  SelectPackageVC.swift
//  American Changer
//
//  Created by iMac on 06/03/21.
//

import UIKit
import RxCocoa
import RxSwift
class PackageTVC: UITableViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var lblPackageName: UILabel!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var imgCheck: UIImageView!
}

class SelectPackageVC: BaseVC {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnShoppingCart: UIButton!
    @IBOutlet weak var tblView: UITableView!
    private let bag = DisposeBag()
    private let viewModel = SelectPackageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar(title: "Select Your Packages", titleImage: nil, leftImage: nil, rightImage: UIImage(named: "icoMenu"), leftTitle: nil, rightTitle: nil, isLeft: true, isRight: true, isLeftMenu: false, isRightMenu: true, bgColor: UIColor(named: "ThemeColor")!, textColor: .white) { (btn) in
            
        } rightClick: { (btn) in
            
        }
        self.tblView.tableFooterView = UIView()
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.updateShoppingCartBtn()
        self.getPackages()
    }
    
    func getPackages() {
        self.viewModel.apiGetAllOffers(dicParam: [:]) { isSuccess in
            if isSuccess! {
                self.tblView.reloadData()
            }
        }
    }
    
    func updateShoppingCartBtn() {
        let arrResult = self.viewModel.objPackages.filter { (singlePackage) -> Bool in
            singlePackage.isSelected == true
        }
        if arrResult.count > 0 {
            self.btnShoppingCart.isUserInteractionEnabled = true
            self.btnShoppingCart.backgroundColor = UIColor(named: "ThemeColor")
        } else {
            self.btnShoppingCart.isUserInteractionEnabled = false
            self.btnShoppingCart.backgroundColor = UIColor(named: "col_disable")
        }
    }
    
    @IBAction func btnShoppingCartClick(_ sender: Any) {
        let arrResult = self.viewModel.objPackages.filter { (singlePackage) -> Bool in
            singlePackage.isSelected == true
        }
        let cart = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.shoppingCart.rawValue) as! ShoppingCartVC
        cart.objSelectedPackages = arrResult
        self.navigationController?.pushViewController(cart, animated: true)
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension SelectPackageVC : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.objPackages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.packageTVC.rawValue, for: indexPath) as! PackageTVC
        let singlePackage = self.viewModel.objPackages[indexPath.row]
        
        if let selected = singlePackage.isSelected, selected == true {
            cell.viewCell.backgroundColor = .white
            cell.lblPackageName.textColor = UIColor(named: "ThemeColor")
            cell.lblCredit.textColor = UIColor(named: "ThemeColor")
            cell.lblAmount.textColor = UIColor(named: "ThemeColor")
            cell.imgCheck.isHidden = false
        } else {
            cell.viewCell.backgroundColor = UIColor(named: "ThemeColor")
            cell.lblPackageName.textColor = .white
            cell.lblCredit.textColor = .white
            cell.lblAmount.textColor = .white
            cell.imgCheck.isHidden = true
            cell.viewCell.borderWidth = 2.0
            cell.viewCell.borderColor = UIColor(named: "ThemeColor")
        }
        cell.lblAmount.text = "\(singlePackage.SpecialOfferValue ?? "")"
        cell.lblPackageName.text = singlePackage.SpecialOfferName
        cell.lblCredit.text = "\(singlePackage.SpecialOfferCredits ?? "")"

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singlePackage = self.viewModel.objPackages[indexPath.row]
        if let selected = singlePackage.isSelected, selected == true {
            self.viewModel.objPackages[indexPath.row].isSelected = false
        } else {
            self.viewModel.objPackages[indexPath.row].isSelected = true
        }
        self.updateShoppingCartBtn()
        tableView.reloadData()
    }
}


