//
//  VCExtension.swift
//  GolfScore
//
//  Created by Nicholas Kearns on 3/22/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import Foundation


//Huge thanks to Wesley Espinoza for providing this extension

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: String(describing: self), bundle:nil)
    }
    @objc func keyboardWillShow(notifaction: NSNotification) {
        if let keyboardSize = (notifaction.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 50
            }
        }
    }
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    func hideKeyboardTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
