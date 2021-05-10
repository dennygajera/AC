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

struct LoginViewModel {
    let email = BehaviorRelay<String>(value: "")
    let password = BehaviorRelay<String>(value: "")
}

struct LoginRequest: Encodable {
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

struct LoginUserData: Codable, DefaultsSerializable {
    var WebUserName: String?
    var WebUserLastName: String?
    var WebUserEmail: String?
    var Birthday: String?
    var LoyaltyProgramCheck :LoyaltyProgramCheck?
    var idWebUser: Int
}

struct UserBalance: Codable, DefaultsSerializable {
    let VirtualCardSerial: Int?
    let VirtualCardBalance: Int?
    let WebUser_idWebUser: Int?
}


struct LoyaltyProgramCheck: Codable {
    var type: String?
    var data: [Int]?
}

extension LoginViewModel{
    func isFieldValidation() -> Bool {
        
        if email.value.isEmpty {
            SnackBar.show(strMessage: ErrorMesssages.EmptyEmail, type: .negative)
            return false
        } else if !email.value.isValidEmail {
            SnackBar.show(strMessage: ErrorMesssages.ValidEmail, type: .negative)
            return false
        }
        else if password.value.isEmpty {
            SnackBar.show(strMessage: ErrorMesssages.EmptyPassword, type: .negative)
            return false
        } else {
            return true
        }
    }
        
    func apiLogin(dicParam: [String: Any], completion :@escaping (_ isSucess : Bool?,_ receivedData: LoginUserData?) -> Void) {
        ServiceManager.shared.request(type: .post, parameterDict: dicParam, URL: API.login.URL, classType: BaseResponse<LoginUserData>.self) { loginUserData, err in
            Defaults[\.token] = loginUserData?.token
            Defaults[\.userId] = loginUserData?.data?.idWebUser
            Defaults[\.userData] = loginUserData?.data
            completion(true, loginUserData?.data)
        }
    }
    
    
}
