//
//  AppDelegate.swift
//  American Changer
//
//  Created by Darshan Gajera on 04/03/21.
//

import UIKit
import FAPanels
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


//    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
//        self.configSideMenu()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func configSideMenu() {
        let rightMenuVC: RightMenuVC =  Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.RightMenu.rawValue) as! RightMenuVC
        
//    if AppPrefsManager.sharedInstance.getUserData() == nil {
//        let centerVC: LoginVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.Login.rawValue) as! LoginVC
//        let centerNavVC = UINavigationController(rootViewController: centerVC)
//        let rootController = FAPanelController()
//        _ = rootController.center(centerNavVC).left(leftMenuVC)
//        window?.rootViewController = rootController
//    } else {
//                    let centerVC: HomeVC = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.home.rawValue) as! HomeVC
//                    let centerNavVC = UINavigationController(rootViewController: centerVC)
//        let rootController = FAPanelController().center(centerNavVC).right(rightMenuVC)
//                    window?.rootViewController = rootController
//                }
    
    }
}

