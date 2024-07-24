//
//  Petition.swift
//  UIKitPro6
//
//  Created by Sothesom on 03/05/1403.
//

import Foundation

//درخواست قابل کد گذاری
struct Petition: Codable {
    var title: String
    var body: String
    // تعداد امضا
    var signatureCount: Int
    
}
