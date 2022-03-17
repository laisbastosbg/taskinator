
import Foundation
import ArgumentParser

struct Taskinator: ParsableCommand {
  
  @Option(name: .shortAndLong, help: "adds a task")
  var add: String?
  
  @Option(name: .shortAndLong, help: "deletes a task (by index)")
  var delete: Int?
  
  @Option(name: .shortAndLong, help: "marks task as done (by index)")
  var finish: Int?
  
  func run() throws {
    let file = File(fileName: "tasks.txt")
    let task = Task()
    
    let tasks = task.getTasks(file)

    if self.add != nil {
      task.addTask(file: file, task: self.add!)
    }
    
    if self.finish != nil {
      task.finishTask(index: self.finish!, tasks, file)
    }
    
    if self.delete != nil {
      task.deleteTask(index: self.delete!, tasks, file)
    }
    
    let updatedTasks = task.getTasks(file)
    
    task.showTasks(updatedTasks)
    
  }
}
