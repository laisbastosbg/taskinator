import Foundation
import ArgumentParser

struct Taskinator: ParsableCommand {
  
  @Option(name: .shortAndLong, help: "adds a task")
  var add: String?
  
  @Option(name: .shortAndLong, help: "deletes a task (by index)")
  var delete: Int?
  
  @Option(name: .shortAndLong, help: "marks task as done (by index)")
  var finish: Int?
  
  @Flag(name: .shortAndLong, help: "Delete all tasks")
  var clear = false
  
  func run() throws {
    let file = File(fileName: "tasks.txt")
    let task = Task()
    
    let tasks = task.getTasks(file)
    
    if self.clear {
      task.deleteAllTasks(file)
    }

    if self.add != nil {
      _ = task.addTask(file: file, task: self.add!)
    }
    
    if self.finish != nil {
      let result = task.finishTask(index: self.finish!, tasks, file)
      print(result)
    }
    
    if self.delete != nil {
      let deletedTask = task.deleteTask(index: self.delete!, tasks, file)
      print(deletedTask.red)
    }
    
    let updatedTasks = task.getTasks(file)
    
    task.showTasks(updatedTasks)
    //print(delete!)
    
  }
}
