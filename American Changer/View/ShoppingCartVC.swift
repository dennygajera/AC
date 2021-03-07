//
//  ShoppingCartVC.swift
//  American Changer
//
//  Created by iMac on 07/03/21.
//

import UIKit

class CartTVC: UITableViewCell {
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var lblPackageName: UILabel!
    @IBOutlet weak var lblCredit: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
}

class CartTotalTVC: UITableViewCell {
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblTotalCredit: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
}


class ShoppingCartVC: UIViewController {
    var objSelectedPackages: [Package]?
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnProceedCheckout: UIButton!
    @IBOutlet weak var btnProceedCheckoutBottom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblView.tableFooterView = UIView()
    }
    
    @IBAction func btnProceedCheckoutClick(_ sender: Any) {
        let payment = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.payment.rawValue) as! PaymentVC
        payment.objCartPackages = self.objSelectedPackages
        self.navigationController?.pushViewController(payment, animated: true)
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getTotalPrice() -> String {
        var price = 0.0
        for singelPrice in objSelectedPackages! {
            price = price + (Double(singelPrice.price) * Double(singelPrice.qty))
        }
        return "$\(price)"
    }
    
    func getTotalCredit() -> String {
        var credit = 0.0
        for singelCredit in objSelectedPackages! {
            credit = credit + Double(singelCredit.credit)
        }
        return "\(credit) credit"
    }
}


extension ShoppingCartVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 2 {
            return 1
        } else {
            return self.objSelectedPackages!.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cartTotalTVC.rawValue, for: indexPath) as! CartTotalTVC
            if indexPath.section == 0 {
                cell.lblTotal.isHidden = true
                cell.lblTotalCredit.text = "Item"
                cell.lblTotalPrice.text = "Price"
            } else {
                cell.lblTotal.isHidden = false
                cell.lblTotalCredit.text = self.getTotalCredit()
                cell.lblTotalPrice.text = self.getTotalPrice()
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.cartTVC.rawValue, for: indexPath) as! CartTVC
            let singlePackage = self.objSelectedPackages![indexPath.row]
            cell.lblQty.text = "\(singlePackage.qty)"
            cell.lblCredit.text = "\(singlePackage.credit)"
            cell.lblPackageName.text = singlePackage.name
            cell.lblPrice.text = "\(Float(singlePackage.price) * Float(singlePackage.qty))"
            
            if singlePackage.qty == 1 {
                cell.btnMinus.isUserInteractionEnabled = false
            } else if singlePackage.qty > 1 {
                cell.btnMinus.isUserInteractionEnabled = true
            }
            
            cell.btnMinus.addTarget(self, action: #selector(btnMinusClick(_:)), for: .touchUpInside)
            cell.btnMinus.tag = indexPath.row
            cell.btnPlus.addTarget(self, action: #selector(btnPlusClick(_:)), for: .touchUpInside)
            cell.btnPlus.tag = indexPath.row
            cell.selectionStyle = .none
            return cell
        }
    }
    
    @objc func btnMinusClick(_ sender: UIButton) {
        self.objSelectedPackages![sender.tag].qty = self.objSelectedPackages![sender.tag].qty - 1
        self.tblView.reloadData()
    }
    
    @objc func btnPlusClick(_ sender: UIButton) {
        self.objSelectedPackages![sender.tag].qty = self.objSelectedPackages![sender.tag].qty + 1
        self.tblView.reloadData()
    }
}
