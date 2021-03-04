//
//  LoginVC.swift
//  American Changer
//
//  Created by Darshan Gajera on 04/03/21.
//

import UIKit
import RxSwift
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
