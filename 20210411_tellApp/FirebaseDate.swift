//
//  FirebaseDate.swift
//  20210411_tellApp
//
//  Created by 佐藤省吾 on 2021/06/15.
//

import Foundation
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: SenderType
}
