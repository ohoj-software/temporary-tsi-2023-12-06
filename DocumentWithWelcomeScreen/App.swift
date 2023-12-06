// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI

enum SceneID: String, CaseIterable {
    // Welcome window
    case welcome

    // The about windows -> "App" -> "About App"
    case about
}

enum AppConstants: String {
    case hideWindowWelcome = "hide.window.welcome"
}

@main
struct ExampleApp: App {

    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {

        WelcomeWindowScene()

        DocumentScene()

        AboutWindowScene()

        Settings {
            SettingsView()
        }
    }
}

struct WelcomeWindowScene: Scene {

    @Environment(\.newDocument) private var newDocument

    var body: some Scene {
        Window("Welcome window", id: SceneID.welcome.rawValue) {
            WelcomeView()
            .onOpenURL(perform: { url in
                print("Window: \(url)")
                // Check that this is a file URL
                guard url.isFileURL else { return }

                let doc = ExampleDocument()
                doc.text = url.lastPathComponent
                newDocument({doc})
                DispatchQueue.main.async {
                    NSApp.closeWindow(.welcome)
                }
            })
        }
    }
}

struct DocumentScene: Scene {

    var body: some Scene {
        DocumentGroup(newDocument: { ExampleDocument() }) { file in
            ContentView(text: file.$document.text)
            // This will never be called
//                .onOpenURL(perform: { url in
//
//                    print("DocumentGroup: \(url)")
//                    // Check that this is a file URL
//                    guard url.isFileURL else { return }
//                })
        }
        .defaultSize(width: 1024, height: 800)
        .defaultPosition(.center)
        .windowStyle(.automatic)
        .windowToolbarStyle(.unified)
    }
}


struct AboutWindowScene: Scene {
    var body: some Scene {
        Window("About", id: SceneID.about.rawValue) {
            VStack {
                Text("Just some example text")
            }
        }
    }
}
