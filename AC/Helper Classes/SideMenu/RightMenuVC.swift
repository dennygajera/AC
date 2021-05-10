//
//  RightMenuVC.swift
//  FAPanels
//
//  Created by Fahid Attique on 17/06/2017.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit

//class RightMenuVC: UIViewController {
//
//
//    @IBOutlet var tableView: UITableView!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//
//        viewConfigurations()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    private func viewConfigurations() {
//
//        tableView.register(UINib.init(nibName: "RightMenuCell", bundle: nil), forCellReuseIdentifier: "RightMenuCell")
//    }
//
//}
//
//extension RightMenuVC: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 8
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RightMenuCell") as! RightMenuCell
//        cell.menuOption.image = UIImage(named: "right_menu_" + String(indexPath.row + 1))
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.deselectRow(at: indexPath, animated: false)
//
//        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        var identifier = ""
//
//        if indexPath.row % 2 == 0 {
//            identifier = "CenterVC1"
//        }
//        else{
//            identifier = "CenterVC2"
//        }
//
//        let centerVC: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: identifier)
//        let centerNavVC = UINavigationController(rootViewController: centerVC)
//
//        panel!.configs.bounceOnCenterPanelChange = true
//
//        /*
//         // Simple way of changing center PanelVC
//         _ = panel!.center(centerNavVC)
//         */
//
//
//
//        /*
//         New Feature Added, You can change the center panelVC and after completion of the animations you can execute a closure
//         */
//
//        panel!.center(centerNavVC, afterThat: {
//            print("Executing block after changing center panelVC From Right Menu")
//        })
//    }
//}

class RightMenuVC: BaseVC {
    @IBOutlet var tableView: UITableView!
    var arrData:NSMutableArray?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @objc func loadSideMenu() {
        let dicHome = ["title": "Home"]
        let dicTap = ["title": "Tap"]
        let dicCheckBalance = ["title": "Check Balance"]
        let dicPurchaseCredits = ["title": "Purchase Credits"]
        let dicTicketsRedemption = ["title": "Tickets Redemption"]
        let dicAccountSetting = ["title": "Account Settings"]
        let dicPurchaseHistory = ["title": "Purchse History"]
        arrData = [dicHome,dicTap,dicCheckBalance,dicPurchaseCredits,dicTicketsRedemption,dicAccountSetting,dicPurchaseHistory]
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
        viewConfigurations()
        self.loadSideMenu()
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
        tableView.register(UINib.init(nibName: Identifier.rightMenuCell.rawValue, bundle: nil), forCellReuseIdentifier: Identifier.rightMenuCell.rawValue)
    }
    
    //    func navigateToSendgift() {
    //        let centerVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.GiftReward.rawValue) as! GiftRewardVC
    //        centerVC.from = LVConstant.sidemenu
    //        let centerNavVC = UINavigationController(rootViewController: centerVC)
    //        panel!.configs.bounceOnCenterPanelChange = true
    //        panel!.center(centerNavVC, afterThat: {
    //            print("Executing block after changing center panelVC From Left Menu")
    //        })
    //    }
    
}

extension RightMenuVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.rightMenuCell.rawValue) as! RightMenuCell
        let dicSingleOption = arrData?.object(at: indexPath.row) as! [String: Any]
        cell.menuOption.text = dicSingleOption["title"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch (indexPath.row) {
        case 1:
            //                self.navigateToAccount()
            break
        default: break
        }
    }
}
