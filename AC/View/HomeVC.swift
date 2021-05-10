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
    
    class func storyboard() -> HomeVC {
        let hmvC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.home.rawValue) as! HomeVC
        return hmvC
    }

    
    @IBAction func btnTapClick(_ sender: Any) {
        let selectpackage = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.selectPackage.rawValue) as! SelectPackageVC
        self.navigationController?.pushViewController(selectpackage, animated: true)
        
    }
    
    @IBAction func btnCheckBalanceClick(_ sender: Any) {
        
    }
    
    @IBAction func btnPurchaseCreditClick(_ sender: Any) {
        
    }
    
    @IBAction func btnTicketRedemptionClick(_ sender: Any) {
        
    }
    

}
