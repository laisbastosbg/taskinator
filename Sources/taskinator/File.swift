import Foundation

class File {
    var fileURL: URL
    var fileName: String

    init(fileName: String) {
        let fileManager = FileManager.default

        //MARK: - Pegar o diretório do documento
        func getDocumentsDiretory() -> URL {
            return fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        }

        let programFolderURL = getDocumentsDiretory()
            .appendingPathComponent(".taskinator")

        self.fileURL = programFolderURL
            .appendingPathComponent(fileName)

        do {
            _ = try String(contentsOf: self.fileURL)
        } catch {
            do {
                _ = try fileManager.createDirectory(at: programFolderURL, withIntermediateDirectories: true, attributes: nil)
                fileManager.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
            } catch {
                print("Não foi possivel criar uma pasta para o projeto")
            }
        }

        self.fileName = fileName
    }

    //MARK: - Ler o conteúdo
    func readContentsOf() -> String {
        do {
            let tasks = try String(contentsOf: self.fileURL)
            return tasks
        } catch {
            return "Não é possível ler o conteúdo do arquivo"
        }
    }

    //MARK: - Adicionar um texto
    func append(text: String) -> String {
        var content = self.readContentsOf()

        content.append(text)

        do {
            try content.write(to: fileURL, atomically: true, encoding: .utf8)
            return content
        } catch {
            return "Não é possivel anexar o conteúdo a pasta"
        }
    }

    //MARK: - Editar
    func overwrite(text: String) {
        do {
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            print("Não é possivel sobrescrever")
        }
    }
}
