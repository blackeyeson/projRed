//
//  GreetViewController.swift
//  projRed
//
//  Created by a on 07.08.22.
//

import UIKit

class GreetViewController: UIViewController {

    let alert = UIAlertController(title: "Warning", message: "Feature unsupported!", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.addAction(okAction)
    }
    @IBAction func GoogleSignIn(_ sender: Any) {
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func AppleSignIn(_ sender: Any) {
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func userAgreement(_ sender: Any) {
        if let url = URL(string: "https://www.redditinc.com/policies/user-agreement") {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)    }
    }
    @IBAction func privacyPolicy(_ sender: Any) {
        if let url = URL(string: "https://www.reddit.com/policies/privacy-policy") {
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
