// Copyright 2023 ohoj Software GmbH. All rights reserved.

import AppKit

extension NSApplication {
    func closeWindow(_ id: SceneID) {
        windows.first { $0.identifier?.rawValue == id.rawValue }?.close()
    }
}

