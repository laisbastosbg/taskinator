import Foundation

class MockTask {
  
  func mockGetTasks(_ file: MockFile) -> [String] {
    let tasksArray = [
      "task 1",
      "task 2",
      "task 3",
      "task 4"
    ]

    return tasksArray
  }
  
  func isTaskFinished(_ task: String) -> Bool {
    let firstChar = Array(task)[0]
    
    if firstChar == "_" {
      return true
    } else {
      return false
    }
  }
  
  func mockFinishTask(index: Int, _ tasksFromFile: [String], _ file: MockFile) -> String {
    if index >= tasksFromFile.count {
      return "Index out of range"
    }
    
    var tasks = tasksFromFile
    let task = tasks[index]
    
    if !isTaskFinished(task) {
      let completedTask = "_\(task)"
      
      tasks.replaceSubrange(index...index, with: [completedTask])
      
      _ = tasks.joined(separator: "\n")
      
      return "ok"
    } else {
      return "Essa tarefa já foi feita."
    }
  }
}
