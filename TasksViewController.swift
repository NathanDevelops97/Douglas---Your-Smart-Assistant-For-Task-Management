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
        
        
        
        self.tblTasks.backgroundColor = UIColor(red: 64/255.0, green: 67/255.0, blue: 68/255.0, alpha: 0)


        self.tblTasks.reloadData()
        self.tblTasks.register(UINib(nibName: "WhiteTaskTableViewCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        tblTasks.tableFooterView = UIView()
        
        let darkModeColor = UIColor(red: 52/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1.0)
        view.backgroundColor = darkModeColor
        
        
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
        
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
        
        cell.selectionStyle = .none

        
        
        return cell
        
    }

   
    
    func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
    }
    
    
    
       func tableView(_ willDisplayforRowAttableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(red: 64/255.0, green: 67/255.0, blue: 68/255.0, alpha: 0)
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            
            taskMgr.removeTask(indexPath.row)
            tblTasks.reloadData()
        }
    }

    
   // EXPAND CELL ON CLICK
    
    // Global Variables/Constants
    
    var extraHeight:CGFloat?
    var selectedRowIndex:Int?
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if extraHeight != nil && selectedRowIndex != nil && selectedRowIndex == indexPath.row{
            return 44 + extraHeight!
        }else{
            return 44
        }
    }
    
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tblTasks.beginUpdates()
        selectedRowIndex = indexPath.row
        extraHeight = 90
        self.tblTasks.endUpdates()
        
    }
    
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.tblTasks.beginUpdates()
        selectedRowIndex = indexPath.row
        extraHeight = 0
        self.tblTasks.endUpdates()
        

    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
