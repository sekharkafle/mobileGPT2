//
//  ChatGPTClient.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/28/23.
//

import Foundation
struct ChatGPTClient {
    let apiUrl = "";
    func getAnswer(question:String) async throws ->ChatGPTItem {
        guard let url = URL(string: apiUrl) else { fatalError("Missing URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["domain": "wiki", "question":question]
        let payload = try JSONEncoder().encode(body)
        urlRequest.httpMethod = "POST"
        let (data, response) = try await URLSession.shared.upload(for: urlRequest, from: payload )

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedItem = try JSONDecoder().decode(ChatGPTItem.self, from: data) as ChatGPTItem
        return decodedItem
    }
    
    func getItemFromChatGPTItem(chatGpt:ChatGPTItem)->Item{
        return Item(data:chatGpt.text, isAnswer: true)
    }
}
