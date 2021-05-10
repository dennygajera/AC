//
//  Package.swift
//  American Changer
//
//  Created by iMac on 07/03/21.
//

import UIKit
import SwiftyUserDefaults
struct Package: Codable {
    let id: Int?
    var qty: Int? = 1
    let price: Int?
    let credit: Int?
    let name : String?
    var isSelected: Bool? = false
    
    let idSpecialOffers: Int?
    let SpecialOfferName: String?
    let SpecialOfferValue: String?
    let SpecialOfferCredits: String?
    let operator_idOperator: Int?
    let SpecialOfferStatus: String?
}

struct DefaultValues: Codable, DefaultsSerializable {
    let foreground: String?
    let background: String?
    let primaryFontColor: String?
    let secondaryFontColor: String?
    let buttonTextColor: String?
    let errorMessageColor: String?
    let idOperator: Int?
}

//struct BaseResponse<T: Codable>: Codable {
//    let status: Int?
//    let data: [T]?
//}

struct BaseResponse<T: Codable>: Codable {
    let status: Int?
    let data: T?
    let message: String?
    let token: String?
}

struct BaseResponseArray<T: Codable>: Codable {
    let status: Int?
    let data: [T]?
    let message: String?
    let token: String?
    
}

