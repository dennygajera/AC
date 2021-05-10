//
//  SplashVC.swift
//  AC
//
//  Created by Darshan Gajera on 05/05/21.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults

class SplashVC: UIViewController {

    let viewModel = SplashViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiCall()
    }
    
    func apiCall() {
        viewModel.apiGetDefaultValues { objDefalutValue in
            let login = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.login.rawValue) as! LoginVC
            self.navigationController?.pushViewController(login, animated: true)
        }
    }
    
}
