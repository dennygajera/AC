//
//  LoginViewModel.swift
//  Loyal Fans Only
//
//  Created by iMac on 07/09/20.
//  Copyright © 2020 Chirag Bhojani. All rights reserved.
//

import UIKit
import RxSwift

struct SignUpViewModel {
    let fname = Variable<String>("")
    let lname = Variable<String>("")
    let email = Variable<String>("")
    let password = Variable<String>("")
    let conpassword = Variable<String>("")
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
    func isFieldValidation() -> Bool {
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
        }   else if password.value == conpassword.value {
            SnackBar.show(strMessage: ErrorMesssages.PasswordMatched, type: .negative)
            return false
        }  else {
            return true
        }
    }
        
//    func apiLogin(dicParam: [String: Any], completion :@escaping (_ isSucess : Bool?,_ receivedData: LoginUserData?) -> Void) {
//        ServiceManager.sharedInstance.postRequest(parameterDict: dicParam, URL: API.signin.URL) { (dicResponse, error) in
//            do {
//                if dicResponse != nil {
//                    if let token = dicResponse?.value(forKey: "APP-SECRET-KEY") {
//                        AppPrefsManager.sharedInstance.setJWTToken(obj: token as AnyObject)
//                    }
//                    completion(true,try JSONDecoder().decode(LoginUserData.self, from: (dicResponse!.dataReturn(isParseDirect: false))!))
//                } else {
//                    completion(false, nil)
//                }
//            }
//            catch let err {
//                print("Err", err)
//                completion(false,nil)
//            }
//        }
//    }
}
