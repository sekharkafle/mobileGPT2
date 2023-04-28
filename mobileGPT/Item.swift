//
//  Item.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/27/23.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var data: String
    var isAnswer: Bool = false
}
