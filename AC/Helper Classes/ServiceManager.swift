
//  Created by Darshan Gajera on 03/26/20.
//  Copyright © 2020 Calendar. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa
import Reachability
import SwiftyUserDefaults

struct ImageData {
    var name: String?
    var img: UIImage?
}

// swiftlint:disable all
enum API : String {
    
    static let BaseURL = "http://americanchanger.cloud:3000/"
    case signup = "submit/signup"
    case login = "submit/login"
    case getOffers = "get/offers/"
    
    case defaultValues = "get/operatorConfig/"
    case userBalance = "get/userBalance/"
    case updateFcmToken = "auth/updateFcmToken"
    case forgotpassword = "forgotpassword"
    case search = "auth/searchuser"
    case postList = "auth/postlist"
    case likepost = "auth/likepost"
    case favoritepost = "auth/favoritepost"
    case newpost = "auth/newpost"
    case pplHistory = "auth/ppvhistory"
    case createppv = "auth/createppv"
    case fanslist = "auth/fanslist"
    case profile = "auth/getprofile"
    case myPost = "auth/getpostdata"
    case editPost = "auth/updatepost"
    case deletePost = "auth/deletepost"
    case editProfile = "auth/editprofile"
    case updateProfile = "auth/updateprofile"
    case subscription = "auth/subscriptionplan"
    case getfans = "auth/getfans"
    case getfollowings = "auth/getfollowings"
    case favoritelist = "auth/favoritelist"
    case changepassword = "auth/changepassword"
    case emailnotification = "auth/emailnotification"
    case addcard = "auth/addcard"
    case followuser = "auth/followuser"
    case createsubscription = "auth/createsubscription"
    case cancelsubscription = "auth/cancelsubscription"
    case sendtip = "auth/sendtip"
    case favoriteprofile = "auth/favoriteprofile"
    case getcomments = "auth/getcomments"
    case likecomment = "auth/likecomment"
    case addcomment = "auth/addcomment"
    case banklist = "auth/banklist"
    case statelist = "auth/statelist"
    case citylist = "auth/citylist"
    case addbank = "auth/addbank"
    case w9formstatus = "auth/w9formstatus"
    case banktransfer = "auth/banktransfer"
    case notificationlist = "auth/notificationlist"
    case statements = "auth/statements"
    case withdrawalreq = "auth/withdrawalreq"
    case paymenthistory = "auth/paymenthistory"
    case paytoppvpost = "auth/paytoppvpost"
    case mycard = "auth/mycard"
    case seenppv = "auth/seenppv"
    case ppvsendtouser = "auth/ppvsendtouser"
    case getpostdetails = "auth/getpostdetails"
    case blockuser = "auth/blockuser"
    case reports = "auth/reports"
    case countrylist = "auth/countrylist"
    case blocklist = "auth/blockuserlist"
    
    
    var URL : String {
        get{
            return API.BaseURL + self.rawValue
        }
    }
}

class ServiceManager: NSObject {
    let disposeBag = DisposeBag()
    static let shared : ServiceManager = {
        let instance = ServiceManager()
        return instance
    }()
    
    
    
    func request<T: Codable>(type: HTTPMethod, parameterDict: [String: Any], URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = false, isFailureAlert: Bool = true, classType: T.Type,  block: @escaping (T?, NSError?) -> Void) {
        print("URL: \(aUrl)")
        print("Param: \(parameterDict)")
        
        if Reachability.Connection.self != .none {
            if isLoader {
                LoadingView.startLoading()
            }
            var header: HTTPHeaders?
            if let token = Defaults[\.token] {
                header =
                    ["Content-Type":"application/json", "Authorization": "\(token)"]
                print("APP_SECRET_KEY: \(token)")
            } else {
                header = ["Content-Type":"application/json"]
            }
            
            var param: [String: Any]? = nil
            
            if type == .post {
                param = parameterDict
            }
            
            
            AF.request(aUrl, method: type, parameters: param, encoding: JSONEncoding.default, headers: header).responseDecodable(of: classType.self ) { response in
                
                if isLoader {
                    LoadingView.stopLoading()
                }
                
                if let error = response.error {
                    print(error.errorDescription ?? "")
                    return
                }
                
                if let result = response.value {
                    print("API RESPONSE=",result.dictionary)
                    let msg = result.dictionary["message"] as? String
                    
                    if (result.dictionary["status"] as! Int) == 1 {
                        if isSuccessAlert {
                            SnackBar.show(strMessage: msg!, type: .positive)
                        }
                        block(result.self, nil)
                    } else {
                        if isFailureAlert {
                            SnackBar.show(strMessage: msg!, type: .negative)
                        }
                    }
                }
            }

                
                    
//                if r.statusCode == 200 {
//                    let dicData = json as! NSDictionary
//                    let status: Bool = dicData.value(forKey: "status") as! Bool
//                        if status {
//                            if isSuccessAlert {
//                                if dicData.value(forKey: "message") != nil {
//                                    SnackBar.show(strMessage: dicData.value(forKey: "message") as! String, type: .positive)
//                                }
//                            }
//                            block(dicData, nil)
//                        } else {
//                            if isFailureAlert {
//                                SnackBar.show(strMessage: dicData.value(forKey: "message") as! String, type: .negative)
//                                block(nil, nil)
//                            } else {
//                                block(nil, nil)
//                            }
//                        }
//                }
//            else if r.statusCode == 404 {
//                    if isFailureAlert {
//                        let dicData = json as! NSDictionary
//                        SnackBar.show(strMessage: dicData.value(forKey: "msg") as! String, type: .negative)
//                    }
//                    AppPrefsManager.sharedInstance.removeDataFromPreference(key: AppPrefsManager.sharedInstance.USER)
//                    //                                let login = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.login.rawValue) as! LoginVC
//
//                    var keyWindow : UIWindow? = nil
//                    #if swift(>=5.1)
//                    if #available(iOS 13, *) {
//                        keyWindow = UIApplication.shared.connectedScenes
//                            .compactMap { $0 as? UIWindowScene }
//                            .flatMap { $0.windows }
//                            .first(where: { $0.isKeyWindow })
//                    } else {
//                        keyWindow = UIApplication.shared.keyWindow
//                    }
//                    #else
//                    keyWindow = UIApplication.shared.keyWindow
//                    #endif
//
//                    //                                let sideMenu = keyWindow?.rootViewController as! RESideMenu
//                    //                                let nav = sideMenu.contentViewController as! UINavigationController
//                    //                                nav.pushViewController(login, animated: false)
//
//                } else if r.statusCode == 403 || r.statusCode == 401 {
//                    AppPrefsManager.sharedInstance.removeDataFromPreference(key: AppPrefsManager.sharedInstance.USER)
//                    //                                let login = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.login.rawValue) as! LoginVC
//                    //                                UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: login)
//
//
//                } else if r.statusCode == 500 {
//                    SnackBar.show(strMessage: ErrorMesssages.wrong, type: .negative)
//                }
            }
        }
    }





//    func postRequestNew(parameterDict:[String : Any], URL aUrl: String, isLoader: Bool = true, isSuccessAlert: Bool = true , isFailureAlert: Bool = true, block: @escaping (NSDictionary?, NSError?) -> Void) {
//        if Reachability.Connection.self != .none {
//            if isLoader {
//                LoadingView.startLoading()
//            }
//
//            let user = "admin"
//            let password = "1234"
//            let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
//            let base64Credentials = credentialData.base64EncodedString(options: [])
//            var header: [String: String]?
//            if(parameterDict["user_id"] != nil) {
//                if let token = AppPrefsManager.sharedInstance.getJWTToken() {
//
//                    header = ["Content-Type":"multipart/form-data","Authorization_token":"eyJ0eXA1iOi0JKV1QiL8CJhb5GciTWvLUzI1NiJ9IiRk2YXRh8Ig",
//                              "App-Secret-Key":token,
//                              "Authorization": "Basic \(base64Credentials)"]
//                } else {
//                    header = ["Content-Type":"multipart/form-data",
//                              "Authorization_token":"eyJ0eXA1iOi0JKV1QiL8CJhb5GciTWvLUzI1NiJ9IiRk2YXRh8Ig",
//                              "App-Secret-Key":"Mn2fKZG4M1170jDlVn6lOFTN6OE27f6UO99n9QDV",
//                              "Authorization": "Basic \(base64Credentials)"]
//                }
//            } else {
//                header = ["Content-Type":"multipart/form-data",
//                          "Authorization_token":"eyJ0eXA1iOi0JKV1QiL8CJhb5GciTWvLUzI1NiJ9IiRk2YXRh8Ig",
//                          "App-Secret-Key":"Mn2fKZG4M1170jDlVn6lOFTN6OE27f6UO99n9QDV",
//                          "Authorization": "Basic \(base64Credentials)"]
//            }
//
//
//            print("URL: \(aUrl)")
//            print("Param: \(parameterDict)")
//            Alamofire.request(aUrl, method: HTTPMethod.post , parameters: parameterDict,encoding: JSONEncoding.default, headers: header).responseJSON {
//                response in
//
//                switch response.result {
//                case .success:
//                    do {
//                        if isLoader {
//                            LoadingView.stopLoading()
//                        }
//                        if response.response?.statusCode == 200 {
//                            if let result = response.result.value {
//                                print(result)
//                                let JSON = result as! NSDictionary
//                                if isSuccessAlert {
//                                    if JSON.value(forKey: "msg") != nil {
//                                        SnackBar.show(strMessage: JSON.value(forKey: "msg") as! String, type: .positive)
//                                    }
//                                }
//                                block(JSON,nil)
//                            }
//                        } else if response.response?.statusCode == 403 || response.response?.statusCode == 401 {
//
//
//                        }
//                    }
//                    break
//                case .failure(let error):
//                    print("Error : ",error)
//                    if isLoader {
//                        LoadingView.stopLoading()
//                    }
//                }
//            }
//        }
//    }
//}

extension URL {
    /// Creates an NSURL with url-encoded parameters.
    init?(string : String, parameters : [String : String]) {
        guard var components = URLComponents(string: string) else { return nil }
        components.queryItems = parameters.map { return URLQueryItem(name: $0, value: $1) }
        guard let url = components.url else { return nil }
        // Kinda redundant, but we need to call init.
        self.init(string: url.absoluteString)
    }
}
