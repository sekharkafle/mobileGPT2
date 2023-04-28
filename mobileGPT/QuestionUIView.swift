//
//  QuestionUIView.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/27/23.
//

import SwiftUI

struct QuestionUIView: View {
    @Binding var question: String
    @Binding var items: [Item]
    
    @State private var isQuerying = false
    
    @State private var showAlert = false
    @State private var alertText = ""
    
    var body: some View {
        HStack {
            TextField(
                isQuerying ? "ChatGPT is thinking 🤔..." : "Type a message...",
                text: $question,
                axis: .vertical
            )
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .lineLimit(1...5)
                .disabled(isQuerying == true)

            Button(action: {
                Task {
                    isQuerying = true
                    let newItem = Item(data: question, isAnswer: false)
                    items.append(newItem)
                    let userQuestion = question
                    question = ""
                    let chatClient = ChatGPTClient()
                    do{
                        let answer = try await chatClient.getAnswer(question: userQuestion)
                        let answerItem = chatClient.getItemFromChatGPTItem(chatGpt: answer)
                        items.append(answerItem)
                        isQuerying = false
                    }catch{
                        let errorAnswerItem = Item(data: "There was an error fetching answer.")
                        items.append(errorAnswerItem)
                        isQuerying = false
                    }
                }
                
            }) {
                Image(systemName: "paperplane.fill")
                    .padding(.horizontal, 10)
                    .foregroundColor(
                        question.isEmpty ? Color(.systemGray6) : Color(red: 0.902, green: 0.404, blue: 0.404)
                    )
            }
            .disabled(question.isEmpty)

        }
        .padding(10)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text(alertText),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct QuestionUIView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionUIView(question: .constant(""), items: .constant([Item(data: "What is your name?", isAnswer: false), Item(data: "Sponge Bob", isAnswer: true)]))
    }
}
