//
//  MainScreenViewController.swift
//  projRed
//
//  Created by a on 06.08.22.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var username = "Guest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiguration()
    }
    @IBAction func homeTap(_ sender: Any) {
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        UIView.transition(with: tableView,
                                    duration: 0.35,
                                    options: .transitionCrossDissolve,
                                    animations:
        { () -> Void in
            self.tableView.reloadData()
        },
                                  completion: nil);
    }
    @IBAction func tapProfile(_ sender: Any) {
        lunchProfileSide()
    }
    @IBAction func swipeProfile(_ sender: Any) {
        lunchProfileSide()
    }
    func lunchProfileSide() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "LeftSideMenuViewController") as! LeftSideMenuViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .flipHorizontal
        vc.username = username
        self.present(vc, animated: true, completion: nil)    }
    func tableConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCellType1", bundle: nil), forCellReuseIdentifier: "TableViewCellType1")
        tableView.reloadData()
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 99 }
    func numberOfSections(in tableView: UITableView) -> Int { 1 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellType1", for: indexPath) as! TableViewCellType1
        return cell
    }
}

