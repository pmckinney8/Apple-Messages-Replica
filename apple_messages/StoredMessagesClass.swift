//
//  StoredMessagesClass.swift
//  apple_messages
//
//  Created by Pariece Mckinney on 4/7/17.
//  Copyright © 2017 Pariece McKinney. All rights reserved.
//

import Foundation
import UIKit


class StoredMessagesClass {
    
    static let instance = StoredMessagesClass()
    private init(){}
    
    
    let messages = [["first_letter": "M", "name": "Mom Cell", "message": "have you made it yet?", "time":"8:30PM >","read_status": "false"], ["first_letter": "L", "name": "Lance", "message": "Playing ball today?", "time":"4:30PM >","read_status": "true"],["first_letter": "K", "name": "Kim (work)", "message": "Don't forget the documents today!", "time":"3:22PM >","read_status": "true"]]
    
    
    
}
