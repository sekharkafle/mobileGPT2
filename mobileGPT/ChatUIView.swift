//
//  ChatUIView.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/27/23.
//

import SwiftUI

struct ChatUIView: View {
    @Binding var items: [Item]

    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                ForEach(items.indices, id: \.self) { item in
                    ItemView(item: items[item]).id(item)
                }
                .onChange(of: items.count) { newValue in
                    withAnimation {
                        value.scrollTo(newValue - 1)
                    }
                }
            }
        }
    }

}

struct ChatUIView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ChatUIView(items:.constant([Item(data: "What is your name?", isAnswer: false), Item(data: "Sponge Bob", isAnswer: true)]))
    }
}
