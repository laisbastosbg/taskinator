//
//  File.swift
//  
//
//  Created by Lais Godinho on 15/03/22.
//

import Foundation

struct File {
  var fileURL: URL
  var fileName: String
  
  init(fileName: String) {
    let fileManager = FileManager.default
    
    func getDocumentsDiretory() -> URL {
      return fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    self.fileURL = getDocumentsDiretory()
      .appendingPathComponent(fileName)
    
    do {
      _ = try String(contentsOf: self.fileURL)
    } catch {
      fileManager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
    }
    
    self.fileName = fileName
  }
  
  func readContentsOf() -> String {
    do {
      let tasks = try String(contentsOf: self.fileURL)
      return tasks
    } catch {
      return "Não foi possível ler o conteúdo do arquivo"
    }
  }
  
  func append(text: String) -> String {
    var content = self.readContentsOf()
    
    content.append(text)
    
    do {
      try content.write(to: fileURL, atomically: true, encoding: .utf8)
      return content
    } catch {
      return "Não foi possível adicionar ao arquivo"
    }
  }
  
  func overwrite(text: String) {
    do {
      try text.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
      print("Não foi possível sobrescrever o arquivo")
    }
  }
}
