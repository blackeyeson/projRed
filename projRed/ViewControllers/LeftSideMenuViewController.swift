//
//  LeftSideMenuViewController.swift
//  projRed
//
//  Created by a on 07.08.22.
//

import UIKit

class LeftSideMenuViewController: UIViewController {

    @IBOutlet var Button: UIButton!
    @IBOutlet var helloThere: UILabel!
    var username = "Guest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloThere.text = "Hello \(username)!"
        if username != "Guest" {
            Button.titleLabel?.text = "Change account"
        }
    }
    @IBAction func tap(_ sender: Any) {
        di()
    }
    @IBAction func swipe(_ sender: Any) {
        di()
    }
    func di() {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func backToStart(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "registrationPage") as! GreetViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
}
