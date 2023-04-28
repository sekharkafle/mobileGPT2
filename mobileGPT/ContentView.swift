//
//  ContentView.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var question: String = ""
    @State private var items: [Item] = []
    var body: some View {
        NavigationView {
            VStack {
                ChatUIView(items: $items)
                    .gesture(
                        TapGesture().onEnded {
                            UIApplication.shared.hideKeyboard()
                        }
                    )
                QuestionUIView(question: $question, items: $items)
            }
            .navigationBarTitle("Mobile GPT")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
