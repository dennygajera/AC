//
//  Package.swift
//  American Changer
//
//  Created by iMac on 07/03/21.
//

import UIKit

struct Package: Codable {
    let id: Int
    let name, credit, price: String
    var isSelected: Bool = false
}
