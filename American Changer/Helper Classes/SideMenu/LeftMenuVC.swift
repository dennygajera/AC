//
//  LeftMenuVC.swift
//  FAPanels
//
//  Created by Fahid Attique on 17/06/2017.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit
import FAPanels

extension Notification.Name {
    static let ChangeSideMenu = Notification.Name("ChangeSideMenu")
}

class LeftMenuVC: BaseVC, QrVCDelegate {

    var status: Bool?
    var isGift: Bool?
    @IBOutlet weak var topConstrainTblView: NSLayoutConstraint!
    @IBOutlet var tableView: UITableView!
    var arrData:NSMutableArray?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(loadSideMenu), name: .ChangeSideMenu, object: nil)
        self.loadSideMenu()
    }
    
    
    @objc func loadSideMenu() {
        let dicHome = ["title": "Home",
                       "icon":SideMenuIcon.Home]
        let dicScan = ["title": "Scan A Purchase",
                       "icon":SideMenuIcon.Scan]
        let dicFind = ["title": "Find A Business",
                       "icon":SideMenuIcon.FindBusiness]
        let dicRewards = ["title": "Browse Rewards",
                          "icon":SideMenuIcon.BrowseReward]
        let dicBadges = ["title": "Your Badges",
                         "icon":SideMenuIcon.YourBadges]
        let dicAccount = ["title": "Account & Settings",
                          "icon":SideMenuIcon.Account]
        let dicSendGift = ["title": "Gift Your Reward",
                           "icon":SideMenuIcon.SendGift]
        let dicRedeemGift = ["title": "Redeem A Reward",
                             "icon":SideMenuIcon.RedeemGift]
        if  AppPrefsManager.sharedInstance.getUserData()?.lovevaRewards?.count == 0{
            isGift = false
            arrData = [dicHome,dicScan,dicFind,dicRewards,dicBadges,dicAccount]
        } else {
            isGift = true
            arrData = [dicHome,dicScan,dicFind,dicSendGift,dicRedeemGift,dicRewards,dicBadges,dicAccount]
        }
        tableView.reloadData()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
        viewConfigurations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func viewConfigurations() {
        tableView.register(UINib.init(nibName: Identifier.LeftMenuCell.rawValue, bundle: nil), forCellReuseIdentifier: Identifier.LeftMenuCell.rawValue)
    }
    
    func navigateToScanAPurchase() {
        let qrVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.Qr.rawValue) as! QrVC
        let navigationcontrollerr = UINavigationController(rootViewController: qrVC)
        qrVC.from = .purchase
        qrVC.delegate = self
        qrVC.strTitle = "Scan A Purchase"
        self.present(navigationcontrollerr, animated: true, completion: nil)
        panel?.closeLeft()
    }
    
    func getPurchaseScanQr(strCode: String, typeofCode: QRFrom) {
        if typeofCode == .purchase {
                self.ScanPurchaseAPiCall(strHeartCode: strCode)
        } else if typeofCode == .redeem {
                self.RedeemAPiCall(strHeartCode: strCode)
        }
    }
    
    func ScanPurchaseAPiCall(strHeartCode: String) {
        let viewModel: HomeViewModel = HomeViewModel()
        viewModel.apiAddHeart(strHearCode: strHeartCode, dicParam: [:]) { (isResult, dicData) in
            if isResult! {
                let successVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.SuccessRedeem.rawValue) as! SuccessRedeemVC
                if let earned: Int = dicData?.value(forKey: "earnedReward") as? Int {
                    if earned == 0 {
                        successVC.from = .purchase
                    } else {
                        successVC.from = .reward
                    }
                }
                let centerNavVC = UINavigationController(rootViewController: successVC)
                self.panel!.configs.bounceOnCenterPanelChange = true
                self.panel!.center(centerNavVC, afterThat: {
                })
            } else {
                self.openCommonAlert(strTitle: dicData?.value(forKey: "message_title") as? String ?? "That didn't go as planned", strDesc: (dicData?.value(forKey: "message") as! String), strButtonTitle: "Ok, Got it!", img: UIImage(named: "ic_invalid_qr_code")!)
            }
        }
    }
    
    
    func RedeemAPiCall(strHeartCode: String) {
        let viewModel: HomeViewModel = HomeViewModel()
        viewModel.apiAddHeart(strHearCode: strHeartCode, dicParam: [:]) { (isResult, dicData) in
            if isResult! {
                let successVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.SuccessRedeem.rawValue) as! SuccessRedeemVC
                successVC.from = .redeem
                let centerNavVC = UINavigationController(rootViewController: successVC)
                self.panel!.configs.bounceOnCenterPanelChange = true
                self.panel!.center(centerNavVC, afterThat: {
                })
            } else {
                self.openCommonAlert(strTitle: dicData?.value(forKey: "message_title") as? String ?? "That didn't go as planned", strDesc: (dicData?.value(forKey: "message") as! String), strButtonTitle: "Ok, Got it!", img: UIImage(named: "ic_invalid_qr_code")!)
            }
        }
    }
    
    
    func navigateToFindABusiness() {
        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.FindBusiness.rawValue) as! FindBusinessVC
        centerVC.from = LVConstant.sidemenu
        let centerNavVC = UINavigationController(rootViewController: centerVC)
        panel!.configs.bounceOnCenterPanelChange = true
        panel!.center(centerNavVC, afterThat: {
            print("Executing block after changing center panelVC From Left Menu")
        })
    }
    func navigateToSendgift() {
        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.GiftReward.rawValue) as! GiftRewardVC
        centerVC.from = LVConstant.sidemenu
        let centerNavVC = UINavigationController(rootViewController: centerVC)
        panel!.configs.bounceOnCenterPanelChange = true
        panel!.center(centerNavVC, afterThat: {
            print("Executing block after changing center panelVC From Left Menu")
        })
    }
    
    func navigateToRedeemgift() {
        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.Qr.rawValue) as! QrVC
        centerVC.strTitle = "Redeem A Reward"
        let centerNavVC = UINavigationController(rootViewController: centerVC)
        panel!.configs.bounceOnCenterPanelChange = true
        panel!.center(centerNavVC, afterThat: {
            print("Executing block after changing center panelVC From Left Menu")
        })
    }
    
    func navigateToAccount() {
        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.Account.rawValue) as! AccountVC
        let centerNavVC = UINavigationController(rootViewController: centerVC)
        panel!.configs.bounceOnCenterPanelChange = true
        panel!.center(centerNavVC, afterThat: {
            print("Executing block after changing center panelVC From Left Menu")
        })
    }
    
    func navigateToHome() {
        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.Home.rawValue) as! HomeVC
        let centerNavVC = UINavigationController(rootViewController: centerVC)
        panel!.configs.bounceOnCenterPanelChange = true
        panel!.center(centerNavVC, afterThat: {
            print("Executing block after changing center panelVC From Left Menu")
        })
    }
    
    func navigateToChangePass() {
////        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.ChangePassword.rawValue) as! ChangePasswordVC
//        let centerNavVC = UINavigationController(rootViewController: centerVC)
//        panel!.configs.bounceOnCenterPanelChange = true
//        panel!.center(centerNavVC, afterThat: {
//            print("Executing block after changing center panelVC From Left Menu")
//        })
    }

    func navigateToBadges() {
        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.Badges.rawValue) as! BadgesVC
        let centerNavVC = UINavigationController(rootViewController: centerVC)
        panel!.configs.bounceOnCenterPanelChange = true
        panel!.center(centerNavVC, afterThat: {
            print("Executing block after changing center panelVC From Left Menu")
        })
    }

}

extension LeftMenuVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.LeftMenuCell.rawValue) as! LeftMenuCell
        let dicSingleOption = arrData?.object(at: indexPath.row) as! [String: Any]
        cell.menuOption.text = dicSingleOption["title"] as? String
        cell.menuImage.image = UIImage(named: dicSingleOption["icon"] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch (indexPath.row) {
            case 0:
                self.navigateToHome()
            break
            case 1:
               self.navigateToScanAPurchase()
            break
            
            case 2:
               self.navigateToFindABusiness()
            break
            case 3:
                if isGift! {
                    self.navigateToSendgift()
                } else {
                    // Reward
                }
            break
            case 4:
                if isGift! {
                    self.navigateToRedeemgift()
                } else {
                    self.navigateToBadges()
                }
                
            break
            case 5:
                if isGift! {
                    // reward pending
                } else {
                    self.navigateToAccount()
                }
            break
        case 6:
            if isGift! {
                self.navigateToBadges()
            } else {
                
            }
            break
        case 7:
            if isGift! {
                self.navigateToAccount()
            } else {
                
            }
            break
            default: break
        }
    }
}
