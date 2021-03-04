//
//  ForgotVC.swift
//  American Changer
//
//  Created by iMac on 04/03/21.
//

import UIKit

class ForgotVC: UIViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSendEmail: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSendEmailClick(_ sender: Any) {
        if (self.txtEmail.text!.isEmpty) {
            SnackBar.show(strMessage: ErrorMesssages.EmptyEmail, type: .negative)
        } else {
            
        }
    }

}
