//
//  LoginVC.swift
//  American Changer
//
//  Created by Darshan Gajera on 04/03/21.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults
class LoginVC: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    
    var viewModel: LoginViewModel = LoginViewModel()
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        txtEmail.text = "dennygajerA@gmail.com"
        txtPassword.text = "Denny@123"
        
        self.txtEmail.rx.text
            .orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)
        
        self.txtPassword.rx.text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
    }
    
    @IBAction func btnLoginClick(_ sender: Any) {
        if self.viewModel.isFieldValidation() {
          // Api call
            let dicData = ["email": txtEmail.text!, "password": txtPassword.text!]
            self.viewModel.apiLogin(dicParam: dicData as [String : Any]) { (isSuccess, userData) in
                if isSuccess! {
                    // navigate to home page
                    self.getUserBalance()
                }
            }
        }
    }
    
    func getUserBalance() {
        ServiceManager.shared.request(type: .get, parameterDict: [:], URL: API.userBalance.URL + "\(Defaults[\.userId] ?? 0)", classType: BaseResponse<UserBalance>.self) { response, err in
            Defaults[\.userBalance] = response?.data
            let home = HomeVC.storyboard()
            self.navigationController?.pushViewController(home, animated: true)
        }
    }
    
    @IBAction func btnForgotPasswordClick(_ sender: Any) {
        let forgot = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.forgotPassword.rawValue) as! ForgotVC
        self.navigationController?.pushViewController(forgot, animated: true)
    }
    
    @IBAction func btnCreateAccountClick(_ sender: Any) {
        let singUp = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.signup.rawValue) as! SignUpVC
        self.navigationController?.pushViewController(singUp, animated: true)
    }
}
