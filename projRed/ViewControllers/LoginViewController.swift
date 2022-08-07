//
//  LoginViewController.swift
//  projRed
//
//  Created by a on 07.08.22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var myView: UIView!
    @IBOutlet var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.layer.cornerRadius = 5
        myView.layer.masksToBounds = true
    }
    
    @IBAction func goBack(_ sender: Any) {
        dis()
    }
    @IBAction func externalTaps(_ sender: Any) {
        dis()
    }
    func dis() {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    @IBAction func Login(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "MainScreenViewController") as! MainScreenViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.username = username.text ?? "Guest"
        self.present(vc, animated: true, completion: nil)
    }
}
