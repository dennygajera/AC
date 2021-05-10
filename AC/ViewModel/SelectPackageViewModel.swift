//
//  SelectPackageViewModel.swift
//  American Changer
//
//  Created by iMac on 07/03/21.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults
class SelectPackageViewModel: NSObject {
    var objPackages = [Package]()
    
    func apiGetAllOffers(dicParam: [String: Any], completion :@escaping (_ isSuccess : Bool?) -> Void) {
        
        let operatorId = Defaults[\.operatorId]!
        
        ServiceManager.shared.request(type: .get, parameterDict: dicParam, URL: "\(API.getOffers.URL)\(operatorId)", classType: BaseResponseArray<Package>.self) { objBaseResponse, err in
            self.objPackages = (objBaseResponse?.data)!
            completion(true)
        }
    }
}



