//
//  SettingsTableViewController.swift
//  Douglas
//
//  Created by Nathanael Grant on 9/30/16.
//  Copyright © 2016 Nathanael Grant. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet var settingsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.settingsTable.reloadData()



        tableView.tableFooterView = UIView()
        self.view.backgroundColor = UIColor(red: 64/255.0, green: 67/255.0, blue: 68/255.0, alpha: 1.0)
        
         let taskColor = UIColor(red: 111/255.0, green: 224/255.0, blue: 120/255.0, alpha: 1.0)
        
        self.navigationController!.navigationBar.tintColor = taskColor

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        

        
        if indexPath.row == 0 {
            
        let identifier = "PNcell"
        var cell: PNCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? PNCell
            
        if cell == nil {
        tableView.register(UINib(nibName: "PNCell", bundle: nil), forCellReuseIdentifier: identifier)
        cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PNCell
                
        cell.TxtLabel.text = "Push Notifications"
        cell.backgroundColor = UIColor(red: 54/255.0, green: 57/255.0, blue: 58/255.0, alpha: 1.0)
        return cell
            }
            
        } else if indexPath.row == 1 {
            
        let identifier = "AScell"
        var cell: ASCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? ASCell
            
        if cell == nil {
        tableView.register(UINib(nibName: "ASCell", bundle: nil), forCellReuseIdentifier: identifier)
        cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ASCell
                
        cell.ASTxtLabel.text = "Review Douglas On The App Store"
        cell.backgroundColor = UIColor(red: 54/255.0, green: 57/255.0, blue: 58/255.0, alpha: 1.0)
        return cell

        }
        }
        
    
        return UITableViewCell()


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
    
}
