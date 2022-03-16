//
//  File.swift
//  
//
//  Created by Lais Godinho on 15/03/22.
//

import ArgumentParser
import Foundation

struct Task: ParsableCommand {
  
  @Option(help: "adds a task")
  var add: String?
  
  @Option(help: "removes a task (by index)")
  var remove: Int?
  
  @Option(help: "marks task as done (by index)")
  var finish: Int?
  
  func getTasks(_ file: File) -> [String] {
    let tasks = file.readContentsOf()
    
    let tasksArray = tasks.components(separatedBy: ",")
    
    return tasksArray.dropLast()
  }
  
  func isTaskFinished(_ task: String) -> Bool {
    let firstChar = Array(task)[0]
    
    if firstChar == "_" {
      return true
    } else {
      return false
    }
  }
  
  func showTasks(_ tasks: [String]) -> Void {
    print("\n")
    for (i, task) in tasks.enumerated() {
      print("\t", terminator: "")
      if(isTaskFinished(task)) {
        var finishedTask = task
        finishedTask.remove(at: finishedTask.startIndex)
        print("(\(i)) ☑️   \(finishedTask)")
      } else {
        print("(\(i)) ▫️   \(task)")
      }
      
    }
    
      print("\n")
  }
  
  func finishTask(index: Int, _ tasksFromFile: [String], _ file: File) {
    var tasks = tasksFromFile
    let task = tasks[index]
    let completedTask = "_\(task),"
    
    tasks.replaceSubrange(index...index, with: [completedTask])
    
    let stringTasks = tasks.joined(separator: ",")
    
    file.overwrite(text: stringTasks)
    
  }
  
  func addTask(file: File) {
    let taskToAdd = self.add! + ","
    _ = file.append(text: taskToAdd)
  }
  
  func run() throws {
    let file = File(fileName: "tasks.txt")
    
    let tasks = getTasks(file)
    
    if self.add != nil {
      addTask(file: file)
    } else if self.finish != nil {
      finishTask(index: self.finish!, tasks, file)
    } else {
      showTasks(tasks)
    }
    
  }
  
}
