//
//  TasksViewController.swift
//  Douglas
//
//  Created by Nathanael Grant on 9/30/16.
//  Copyright © 2016 Nathanael Grant. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblTasks: UITableView!
    
    //For persisting data
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tblTasks.reloadData()
        self.tblTasks.register(UINib(nibName: "WhiteTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        tblTasks.tableFooterView = UIView()
        
        tblTasks.dataSource = self;

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tblTasks.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 90.0;//Choose your custom row height
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
            taskMgr.removeTask(indexPath.row)
            tblTasks.reloadData()
        }
    }

    
    
    //Define how our cells look - 2 lines a heading and a subtitle
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        
        let identifier = "nameCell"
        var cell: WhiteTaskTableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? WhiteTaskTableViewCell
        
        if cell == nil {
            tableView.register(UINib(nibName: "WhiteTaskTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? WhiteTaskTableViewCell
        }
        
        
        //        Assign the contents of our var "items" to the textLabel of each cell
        //        cell.textLabel!.text = taskMgr.tasks[indexPath.row].name
        //        cell.detailTextLabel!.text = taskMgr.tasks[indexPath.row].desc
        
        cell.TaskNameLabel.text = taskMgr.tasks[indexPath.row].name
        cell.NotesLabel.text = taskMgr.tasks[indexPath.row].note

        
        
     
        return cell
        
        
        
    
    
    
    
    

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
