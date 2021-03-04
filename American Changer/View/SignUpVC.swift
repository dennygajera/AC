//
//  SignUpVC.swift
//  American Changer
//
//  Created by Darshan Gajera on 04/03/21.
//

import UIKit
import RxSwift
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
        if self.viewModel.isFieldValidation() {
            
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
