//
//  TaskTests.swift
//  
//
//  Created by Lais Godinho on 22/03/22.
//

import XCTest

@testable import taskinator

class TaskTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func test_getTask_passingFile_toReturnArrayOfTasks() {
    let sut = MockTask()
    
    let mockFile = MockFile(fileName: "mocked_file")
    
    let expected = [
      "task 1",
      "task 2",
      "task 3",
      "task 4"
    ]
    
    let output = sut.getTasks(mockFile)
    
    XCTAssertEqual(output, expected)
  }
  
  func test_finishTask_taskIsNotFinshed_toReturnSucessMessage() {
    let sut = MockTask()
    
    let mockedIndex = 1
    let mockedTasksFromFile = ["task 1", "task 2", "task 3"]
    let mockedFile = MockFile(fileName: "mocked_file")
    
    let output = sut.finishTask(index: mockedIndex, mockedTasksFromFile, mockedFile)
    let expected = "ok"
    
    XCTAssertEqual(output, expected)
    
  }
  
  func test_finishTask_taskIsFinished_toReturnErrorMessage() {
    let sut = MockTask()
    
    let mockIndex = 1
    let mockTasksFromFile = ["_task 1", "_task 2", "_task 3"]
    let mockFile = MockFile(fileName: "mocked_file")
    
    let output = sut.finishTask(index: mockIndex, mockTasksFromFile, mockFile)
    let expected = "This task has already been completed."
    
    XCTAssertEqual(output, expected)
    
  }
  
  func test_finishTask_OutOfRangeIndex_toReturnIndexOutOfRange() {
    let sut = MockTask()
    
    let mockedIndex = 5
    let mockedTasksFromFile = ["_task 1", "_task 2", "_task 3"]
    let mockedFile = MockFile(fileName: "mocked_file")
    
    let output = sut.finishTask(index: mockedIndex, mockedTasksFromFile, mockedFile)
    let expected = "Index out of range"
    
    XCTAssertEqual(output, expected)
    
  }
  
  func test_addTask_passingStringTask_toReturnArrayWithOldAndNewTasks() {
    let sut = MockTask()
    
    let newTask = "here is another task"
    
    let file = MockFile(fileName: "mock_file.txt")
    
    let output = sut.addTask(file: file, task: newTask)
    
    let expected = [
      "task 1",
      "task 2",
      "task 3",
      "task 4",
      newTask
    ]
    
    XCTAssertEqual(output, expected)
  }
  
  func test_deleteTask_OutOfRangeIndex_toReturnIndexOutOfRange() {
    let sut = MockTask()
    
    let tasksFromFile = [
      "task 1",
      "task 2",
      "task 3",
      "task 4"
    ]
    
    let index = 5
    
    let file = MockFile(fileName: "mock_file.txt")
    
    let output = sut.deleteTask(index: index, tasksFromFile, file)
    
    let expected = "Index out of range"
    
    XCTAssertEqual(output, expected)
  }
  
  func test_deleteTask_existingTask_toReturnDeletedTask() {
    let sut = MockTask()
    
    let tasksFromFile = [
      "task 1",
      "task 2",
      "task 3",
      "task 4"
    ]
    
    let index = 2
    
    let file = MockFile(fileName: "mock_file.txt")
    
    let output = sut.deleteTask(index: index, tasksFromFile, file)
    
    let expected = "task 3"
    
    XCTAssertEqual(output, expected)
  }

}
