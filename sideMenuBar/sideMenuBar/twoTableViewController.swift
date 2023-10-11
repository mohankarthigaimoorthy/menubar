//
//  twoTableViewController.swift
//  sideMenuBar
//
//  Created by Imcrinox Mac on 17/12/1444 AH.
//

import UIKit

class twoTableViewController: menuTableViewController {

    var menuTitle = ["playlists", "hitlists" ,"playback", "upcoming", "evergreen list", "trending","queuelist"]
    
    var currentItem = "Enjoy Every Moments"
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.backgroundColor = UIColor(red: 0.109, green: 0.114, blue: 0.128, alpha: 11)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let twotableViewController = segue.source as! twoTableViewController
        
        if let selectedRow = twotableViewController.tableView.indexPathForSelectedRow?.row {
            currentItem = menuTitle[selectedRow]
        }
    }
}

extension twoTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! twoTableViewCell
        
        cell.titleContent.text = menuTitle[indexPath.row]
        cell.titleContent.textColor = (menuTitle[indexPath.row] == currentItem) ? UIColor.white : UIColor.gray
        cell.backgroundColor = UIColor.clear
        return cell
    }
}
