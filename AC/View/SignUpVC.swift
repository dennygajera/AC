//
//  SignUpVC.swift
//  American Changer
//
//  Created by Darshan Gajera on 04/03/21.
//

import UIKit
import RxSwift
import SwiftyUserDefaults

class SignUpVC: UIViewController {

    @IBOutlet weak var txtFname: UITextField!
    @IBOutlet weak var txtLname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var btnTerms: UIButton!
    @IBOutlet weak var btnBackToLogin: UIButton!
    
    var viewModel = SignUpViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.txtFname.text = "denny1"
        self.txtLname.text = "gajera1"
        self.txtPassword.text = "Denny@123"
        self.txtConfirmPassword.text = "Denny@123"
        self.txtEmail.text = "dennygajera1@gmail.com"
        
        self.txtFname.rx.text
            .orEmpty
            .bind(to: viewModel.fname)
            .disposed(by: disposeBag)
        
        self.txtLname.rx.text
            .orEmpty
            .bind(to: viewModel.lname)
            .disposed(by: disposeBag)
        
        self.txtConfirmPassword.rx.text
            .orEmpty
            .bind(to: viewModel.conpassword)
            .disposed(by: disposeBag)
        
        
        self.txtEmail.rx.text
            .orEmpty
            .bind(to: viewModel.email)
            .disposed(by: disposeBag)
        
        self.txtPassword.rx.text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
    }
    

    @IBAction func btnCreateAccountClick(_ sender: Any) {
        if !self.viewModel.isFieldValidation() {
            return
        }
        
        if self.btnTerms.isSelected {
            SnackBar.show(strMessage: ErrorMesssages.tnc, type: .negative)
        }
        
        let dicParam = ["name":txtFname.text!,
                        "lastname":txtLname.text!,
                        "email":txtEmail.text!,
                        "operator_id": "\(Defaults[\.defaultappData]?.idOperator ?? 0)" ,
                        "password":txtPassword.text!]
        self.viewModel.apiSignup(dicParam: dicParam) { (isSuccess) in
            let loginViewModel = LoginViewModel()
            let dicData = ["email": self.txtEmail.text!, "password": self.txtPassword.text!]
            loginViewModel.apiLogin(dicParam: dicData as [String : Any]) { (isSuccess, userData) in
                if isSuccess! {
                    // navigate to home page
                    let home = HomeVC.storyboard()
                    self.navigationController?.pushViewController(home, animated: true)
                }
            }
        }
    }
    
    @IBAction func btnTermsClick(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    @IBAction func btnBackToLoginClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   

}
