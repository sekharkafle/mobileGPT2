//
//  ChatGPTItem.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/28/23.
//

import Foundation

struct ChatGPTItem: Codable {
    var text: String
    //var sourceDocuments:[SourceDocument]
}

struct SourceDocument:Codable {
    var pageContent:String
}
