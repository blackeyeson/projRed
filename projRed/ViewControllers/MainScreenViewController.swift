//
//  MainScreenViewController.swift
//  projRed
//
//  Created by a on 06.08.22.
//

import UIKit
import SwiftSoup

struct RedditPosts: Decodable {
    let data: ListingData
}

struct ListingData: Decodable {
    let children: [PostData]
}

struct PostData: Decodable {
    let data: Post
}

struct Post: Decodable {
    let title: String
    let subreddit: String
    let subreddit_name_prefixed: String
    let ups: Int
    let domain: String
//    let gallery_data: GalleryItem?
    let score: Int
    let is_created_from_ads_ui: Bool
    let thumbnail: URL
    let url_overridden_by_dest: URL
    let url: URL
}

struct GalleryItem: Decodable {
    let items: [Item]
}

struct Item: Decodable {
    let media_id: String
    let id: Int
}

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var username = "Guest"
    var subreddit = "pics"
    let redditData: RedditPosts? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiguration()
        print("bbb")
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
        self.present(vc, animated: true, completion: nil)
    }
    
    func tableConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCellType1", bundle: nil), forCellReuseIdentifier: "TableViewCellType1")
        scrapeReddit()
        tableView.reloadData()
    }
    
    func scrapeReddit() {
        /*
         do {
         let url = URL(string: "https://old.reddit.com/r/pics/top/?sort=top&t=month")!
         let content = try String(contentsOf: url)
         let doc: Document = try SwiftSoup.parse(content)
         
         let postsWithAds: Elements = try doc.getElementsByClass("thing")
         let posts = try postsWithAds.filter{ try !$0.className().contains("promotedlink") }
         let votes = try posts[3].getElementsByClass("likes").first()!.text()
         let title = try posts[3].getElementsByClass("title may-blank outbound").first()!.text()
         let imgRef = try posts[3].getElementsByClass("thumbnail").first()
         print("-----------------------")
         print(posts.count, votes, title, imgRef)
         print("-----------------------")
         } catch { print("err404")}
         */
        if let url = URL(string: "https://www.reddit.com/r/\(subreddit)/top/.json?t=month&limit=99") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let parsedJSON = try jsonDecoder.decode(RedditPosts.self, from: data)
                        parsedJSON.data.children.forEach { print($0.data.title) }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
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

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

