//
//  ItemView.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/27/23.
//

import SwiftUI

struct ItemView: View {
    var item: Item

    var body: some View {
        let botBackgroundColor = Color(red: 1, green: 0.824, blue: 0.788)
        let userBackgroundColor = Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255)
        let botBorderColor = Color(red: 0.965, green: 0.592, blue: 0.518)
        let userBorderColor = Color(red: 0.906, green: 0.898, blue: 0.894)

        HStack {
            Spacer()
                .frame(width: item.isAnswer ? 10 : 30)
            Text(item.data)
                .frame(maxWidth: .infinity)
                .padding(20)
                .foregroundColor(Color.black)
                .background(item.isAnswer ? botBackgroundColor : userBackgroundColor)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(item.isAnswer ? botBorderColor : userBorderColor, lineWidth: 1)
                )
            Spacer()
                .frame(width: item.isAnswer ? 30 : 10)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item(data: "This is test Data", isAnswer: false))
    }
}
