//
//  LoginViewModel.swift
//  Loyal Fans Only
//
//  Created by iMac on 07/09/20.
//  Copyright © 2020 Chirag Bhojani. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults

struct SignUpViewModel {
    let fname =  BehaviorRelay<String>(value: "")
    let lname =  BehaviorRelay<String>(value: "")
    let email =  BehaviorRelay<String>(value: "")
    let password =  BehaviorRelay<String>(value: "")
    let conpassword =  BehaviorRelay<String>(value: "")
}

struct SignUpRequest: Encodable {
    var email: String?
    var password: String?
    var device_id: String?
    var device_type: String?
    var fcm_token: String?
    var type: String?
    var fb_id: String?
    var google_id: String?
    var name: String?
    var apple_id: String?
}

struct SignUpData: Codable {
    var name: String?
    var user_id: String?
    var username: String?
    var email: String?
    var profile_img: String?
    var thumb: String?
    var card_status: String?
}

extension SignUpViewModel{
    func isFieldValidation() -> Bool
    {
        if fname.value.isEmpty {
            SnackBar.show(strMessage: ErrorMesssages.EmptyFirstName, type: .negative)
            return false
        } else if lname.value.isEmpty {
            SnackBar.show(strMessage: ErrorMesssages.EmptyLastName, type: .negative)
            return false
        } else if email.value.isEmpty {
            SnackBar.show(strMessage: ErrorMesssages.EmptyEmail, type: .negative)
            return false
        } else if !email.value.isValidEmail {
            SnackBar.show(strMessage: ErrorMesssages.ValidEmail, type: .negative)
            return false
        } else if password.value.isEmpty {
            SnackBar.show(strMessage: ErrorMesssages.EmptyPassword, type: .negative)
            return false
        }  else if conpassword.value.isEmpty {
            SnackBar.show(strMessage: ErrorMesssages.EmptyConfirmPassword, type: .negative)
            return false
        }   else if password.value != conpassword.value {
            SnackBar.show(strMessage: ErrorMesssages.PasswordMatched, type: .negative)
            return false
        }  else {
            return true
        }
    }
        
    func apiSignup(dicParam: [String: Any], completion :@escaping (_ isSucess : Bool?) -> Void) {
        ServiceManager.shared.request(type: .post, parameterDict: dicParam, URL: API.signup.URL, classType: BaseResponse<LoginUserData>.self) { objBaseResponse, err in
                completion(true)
        }
    }
}
