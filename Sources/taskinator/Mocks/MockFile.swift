import Foundation

class MockFile {
  var fileURL: URL
  var fileName: String
  
  init(fileName: String) {
    let fileManager = FileManager.default
    
    func getDocumentsDiretory() -> URL {
      return fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    self.fileURL = getDocumentsDiretory()
      .appendingPathComponent(fileName)
    
    self.fileName = fileName
  }
  
  
}
