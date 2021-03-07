//
//  Package.swift
//  American Changer
//
//  Created by iMac on 07/03/21.
//

import UIKit

struct Package: Codable {
    let id: Int
    var qty: Int = 1
    var price: Int
    var credit: Int
    let name : String
    var isSelected: Bool = false
}
