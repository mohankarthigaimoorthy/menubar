//
//  oneTableViewController.swift
//  sideMenuBarUITests
//
//  Created by Imcrinox Mac on 17/12/1444 AH.
//

import UIKit

class oneTableViewController: menuTableViewController {
    let menutransitionManager = menuTransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Enjoy Every Moments"
//        self.view.backgroundColor = UIColor(red:0.062, green:0.062, blue:0.07, alpha:1)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let twotableViewController = segue.destination as! twoTableViewController
            twotableViewController.currentItem = self.title!
            twotableViewController.transitioningDelegate = menutransitionManager
            menutransitionManager.delegate = self
            
        }
    }
}

extension oneTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! oneTableViewCell
        cell.backgroundColor = UIColor.clear
        
        if indexPath.row == 0 {
            cell.userPost.image = UIImage(named: "1")
            cell.userTitle.text = "Karikuzhambu Vaasam"
            cell.userSubTitle.text = "GV Prakash"
            cell.userProfile.image = UIImage(named: "a")
            
        }
        else if indexPath.row == 1{
            cell.userPost.image = UIImage(named: "2")
            cell.userTitle.text = "en roja neeya."
            cell.userSubTitle.text = "sid sriram"
            cell.userProfile.image = UIImage(named: "b")
        }
        else if indexPath.row == 2{
            cell.userPost.image = UIImage(named: "3")
            cell.userTitle.text = "yedo ondru yennaithakka"
            cell.userSubTitle.text = "yuvan shankar"
            cell.userProfile.image = UIImage(named: "c")
        }
        else if indexPath.row == 3 {
            cell.userPost.image = UIImage(named: "4")
            cell.userTitle.text = "thuli thiuli mazahai"
            cell.userSubTitle.text = "yuvan shankar"
            cell.userProfile.image = UIImage(named: "d")
            
        }
        else if indexPath.row == 4 {
            cell.userPost.image = UIImage(named: "5")
            cell.userTitle.text = "adiye neethanadi penne"
            cell.userSubTitle.text = "gv praksh"
            cell.userProfile.image = UIImage(named: "e")
        }
        
        else {
            cell.userPost.image = UIImage(named: "6")
            cell.userTitle.text = "selfie pulla giveme"
            cell.userSubTitle.text = "anirudh ravichandran"
            cell.userProfile.image = UIImage(named: "f")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(260)
    }
}

extension oneTableViewController : menuTransitionManagerDelegate {
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
