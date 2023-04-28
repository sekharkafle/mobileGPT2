//
//  UIApplication+Keyboard.swift
//  mobileGPT
//
//  Created by Sekhar Kafle on 4/28/23.
//

import UIKit
extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
