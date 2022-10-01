import Foundation
import ArgumentParser

struct Taskinator: ParsableCommand {
  
  @Option(name: .shortAndLong, help: "adiciona uma atividade")
  var add: String?
  
  @Option(name: .shortAndLong, help: "deleta uma atividade)")
  var delete: Int?
  
  @Option(name: .shortAndLong, help: "Marca atividade como feita")
  var finish: Int?
  
  @Flag(name: .shortAndLong, help: "Deleta todas as atividades")
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
