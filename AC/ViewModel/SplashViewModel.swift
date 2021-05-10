//
//  SplashViewModel.swift
//  AC
//
//  Created by Darshan Gajera on 05/05/21.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyUserDefaults

class SplashViewModel: NSObject {
    func apiGetDefaultValues(block: @escaping(DefaultValues?) -> Void) {
        ServiceManager.shared.request(type: .get, parameterDict: [:], URL: "\(API.defaultValues.URL)com.AC.Admin", classType: BaseResponseArray<DefaultValues>.self) { objDefaultValues, err in
            Defaults[\.defaultappData] = objDefaultValues?.data?.first
            Defaults[\.operatorId] = "\(objDefaultValues?.data?.first?.idOperator ?? 0)"
            block(objDefaultValues?.data?.first)
            
        }
    }
}

