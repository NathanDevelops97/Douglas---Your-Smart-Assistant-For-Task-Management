//
//  TaskManager.swift
//  Douglas
//
//  Created by Nathanael Grant on 9/30/16.
//  Copyright © 2016 Nathanael Grant. All rights reserved.
//

import UIKit

var taskMgr: TaskManager = TaskManager()

struct AddTask {
    var name = "Name"
    var note = "Note"
}

class TaskManager: NSObject {
    
    var tasks = [AddTask]()
    var persistenceHelper: PersistenceHelper = PersistenceHelper()
    
    override init(){
        
        let tempTasks:NSArray = persistenceHelper.list(entity: "Task")
        for res:AnyObject in tempTasks as [AnyObject] {
            tasks.append(AddTask(name:res.value(forKey: "name")as! String,note:res.value(forKey: "note") as! String))
        }
    }
    
    func addTask(_ name:String, note: String){
        
        var dicTask: Dictionary<String, String> = Dictionary<String,String>()
        dicTask["name"] = name
        dicTask["note"] = note
        
        
        if(persistenceHelper.save(entity: "Task", parameters: dicTask)){
            tasks.append(AddTask(name: name, note: note))
        }
    }
    
    func removeTask(_ index:Int){
        
        let value:String = tasks[index].name
        
        if(persistenceHelper.remove(entity: "Task", key: "name", value: value)){
            tasks.remove(at: index)
        }
    }
    
    
}
