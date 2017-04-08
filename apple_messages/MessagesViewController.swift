//
//  ViewController.swift
//  apple_messages
//
//  Created by Pariece Mckinney on 4/7/17.
//  Copyright © 2017 Pariece McKinney. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!

    
    var messages = StoredMessagesClass.instance.messages
    var searchResults = [[String:String]]()
    var searchController: UISearchController!
    var shouldShowSearchResults = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelectionDuringEditing = true
        
        configureSearchController()
    }
    
    
    //tableview functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessagesTableViewCell
        cell.userButtonImage.setTitle(messages[indexPath.row]["first_letter"], for: .normal)
        cell.userButtonImage.layer.cornerRadius = 0.5 * cell.userButtonImage.bounds.size.width
        cell.userButtonImage.clipsToBounds = true
        cell.contactNameLabel.text = messages[indexPath.row]["name"]
        cell.contactMessageLabel.text = messages[indexPath.row]["message"]
        cell.messageTimeLabel.text = messages[indexPath.row]["time"]
        
        if messages[indexPath.row]["read_status"] == "true" {
            cell.readButton.isHidden = true
        }else{
            cell.readButton.isHidden = false
            cell.readButton.layer.cornerRadius = 0.5 * cell.readButton.bounds.size.width
            cell.readButton.clipsToBounds = true
        }
        
        
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //code to remove cell
        
        tableView.reloadData()

    }
    
    
    //searchbar functions
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
  
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        tableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        tableView.reloadData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tableView.reloadData()
        }
        
        searchController.searchBar.resignFirstResponder()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text!
        
        print(searchString)
    }
    
    
    //toolbar show/hide functions
    
    func showToolBar(){
   
    }
    
    
    

 
    @IBAction func editButtonPressed(_ sender: Any) {
        
        let button = sender as! UIBarButtonItem
        
       
        if button.title! == "Edit" {
             button.title = "Cancel"
            tableView.setEditing(true, animated: true)
            self.navigationController?.setToolbarHidden(false, animated: true)
            
            let item1 = UIBarButtonItem(title: "Read All", style: .plain, target: self, action: nil)
            
            let item2 = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: nil)
            
            let right = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
            
            
            self.navigationController?.toolbar.setItems([item1,right,item2], animated: true)
        }else {
            button.title = "Edit"
            self.navigationController?.setToolbarHidden(true, animated: true)
            tableView.setEditing(false, animated: true)
        }
        
        
        
        
        
        
    
        
    }
    
    
    



}

