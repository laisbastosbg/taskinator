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
  
  func test_getTask_passingFile_toReturnArrayOfStrings() {
    let sut = MockTask()
    
    let mockFile = MockFile(fileName: "mocked_file")
    
    sut.mockGetTasks(mockFile)
  }
  
  func test_finishTask_taskIsNotFinshed_toReturnOk() {
    let sut = MockTask()
    
    let mockedIndex = 1
    let mockedTasksFromFile = ["task 1", "task 2", "task 3"]
    let mockedFile = MockFile(fileName: "mocked_file")
    
    let output = sut.mockedFinishTask(index: mockedIndex, mockedTasksFromFile, mockedFile)
    let expected = "ok"
    
    XCTAssertEqual(output, expected)
    
  }
  
  func test_task_finishFinishedTask_toReturnTaskAlreadyDone() {
    let sut = MockTask()
    
    let mockIndex = 1
    let mockTasksFromFile = ["_task 1", "_task 2", "_task 3"]
    let mockFile = MockFile(fileName: "mocked_file")
    
    let output = sut.mockFinishTask(index: mockIndex, mockTasksFromFile, mockFile)
    let expected = "Essa tarefa já foi feita."
    
    XCTAssertEqual(output, expected)
    
  }
  
  func test_task_OutOfRangeIndex_toReturnIndexOutOfRange() {
    let sut = MockTask()
    
    let mockedIndex = 5
    let mockedTasksFromFile = ["_task 1", "_task 2", "_task 3"]
    let mockedFile = MockFile(fileName: "mocked_file")
    
    let output = sut.mockedFinishTask(index: mockedIndex, mockedTasksFromFile, mockedFile)
    let expected = "Index out of range"
    
    XCTAssertEqual(output, expected)
    
  }
  
}
