// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var exampleText: UTType {
        UTType(importedAs: "com.ohoj-software.plain-text")
    }
}

class ExampleDocument: ReferenceFileDocument {
    static var readableContentTypes: [UTType] { [.exampleText] }

    typealias Snapshot = String

    var text: String

    init() {
        text = ""
    }

    required init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.fileWrappers?["project.json"]?.regularFileContents,
              let string = try? JSONDecoder().decode(String.self, from: data)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }

    func snapshot(contentType: UTType) throws -> String {
        text
    }

    func fileWrapper(snapshot: String, configuration: WriteConfiguration) throws -> FileWrapper {
        let rootDirectory = FileWrapper(directoryWithFileWrappers: [:])
        let meta = try JSONEncoder().encode(text)
        let projectWrapper = FileWrapper(regularFileWithContents: meta)
        projectWrapper.filename = "project.json"
        projectWrapper.preferredFilename="project.json"
        rootDirectory.addFileWrapper(projectWrapper)
        return rootDirectory
    }

}
