// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI

@main
struct DocumentWithWelcomeScreenApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: DocumentWithWelcomeScreenDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
