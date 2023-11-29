//
//  ContactDetails.swift
//  TableViewEditTask
//
//  Created by Yudiz-subhranshu on 10/04/23.
//

import UIKit

class ContactDetails: NSObject {
    var fistName : String
    var lastName : String
    var phoneNum : String
    var photo : String
    
    init(fistName: String, lastName: String, phoneNum: String, photo: String) {
        self.fistName = fistName
        self.lastName = lastName
        self.phoneNum = phoneNum
        self.photo = photo
    }

}
