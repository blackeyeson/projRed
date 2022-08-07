//
//  RightSideMenuViewController.swift
//  projRed
//
//  Created by a on 07.08.22.
//

import UIKit

class RightSideMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
}
