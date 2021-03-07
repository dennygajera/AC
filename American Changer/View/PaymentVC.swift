//
//  PaymentVC.swift
//  American Changer
//
//  Created by iMac on 07/03/21.
//

import UIKit

class PaymentVC: UIViewController {
    @IBOutlet weak var lblTotalToPay: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnReviewOrder: UIButton!
    var objCartPackages: [Package]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblTotalToPay.text = "\(getTotalPrice())"
    }
    

    func getTotalPrice() -> Float {
        var price = 0.0
        for singelPrice in objCartPackages! {
            price = price + (Double(singelPrice.price) * Double(singelPrice.qty))
        }
        return Float(price)
    }
    
    @IBAction func btnReviewOrderClick(_ sender: Any) {
        
    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
