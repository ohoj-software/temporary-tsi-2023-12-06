// Copyright 2023 ohoj Software GmbH. All rights reserved.

import AppKit

// https://developer.apple.com/documentation/swiftui/nsapplicationdelegateadaptor
final class AppDelegate: NSObject, NSApplicationDelegate {
    /// If you don’t want to open an untitled document when the app is launched or activated, implement the app delegate method applicationShouldOpenUntitledFile: to return NO.
    func applicationShouldOpenUntitledFile(_ sender: NSApplication) -> Bool {
        false
    }

    func applicationOpenUntitledFile(_ sender: NSApplication) -> Bool {
        false
    }

    /// If you do want to open an untitled document when launched, but don't want to open an untitled document when the
    /// app is already running and activated from the dock, you can instead implement the delegate’s applicationShouldHandleReopen:hasVisibleWindows: method to return NO.
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        false
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        let hideWindowWelcome = UserDefaults.standard.bool(forKey: AppConstants.hideWindowWelcome.rawValue)

        // Only show the app if the user chooses to do so
        if hideWindowWelcome {
            NSApp.closeWindow(.welcome)
        }
    }

}
