//
//  SelectPackageViewModel.swift
//  American Changer
//
//  Created by iMac on 07/03/21.
//

import UIKit
import RxSwift
import RxCocoa
class SelectPackageViewModel: NSObject {
    var objPackages = [Package]()
    
    func apiCallForPackage() {
        let singlePackgae = Package(id: 1, price: 10, credit: 100, name: "Denny1")
        let singlePackgae1 = Package(id: 2, price: 20, credit: 200, name: "Denny2")
        objPackages.append(singlePackgae)
        objPackages.append(singlePackgae1)
    }
}



