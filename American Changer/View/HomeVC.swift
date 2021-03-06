//
//  HomeVC.swift
//  American Changer
//
//  Created by iMac on 04/03/21.
//

import UIKit

class HomeVC: BaseVC {

    @IBOutlet weak var btnTap: UIButton!
    @IBOutlet weak var btnCheckBalance: UIButton!
    @IBOutlet weak var btnPurchaseCredit: UIButton!
    @IBOutlet weak var btnTicketRedemption: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        self.setNavigationBar(title: nil, titleImage: nil, leftImage: nil, rightImage: UIImage(named: "icoMenu"), leftTitle: nil, rightTitle: nil, isLeft: true, isRight: true, isLeftMenu: false, isRightMenu: true, bgColor: UIColor(named: "ThemeColor")!, textColor: .white) { (btn) in
            
        } rightClick: { (btn) in
            
        }
    }

    
    @IBAction func btnTapClick(_ sender: Any) {
        
    }
    
    @IBAction func btnCheckBalanceClick(_ sender: Any) {
        
    }
    
    @IBAction func btnPurchaseCreditClick(_ sender: Any) {
        
    }
    
    @IBAction func btnTicketRedemptionClick(_ sender: Any) {
        
    }
    

}
