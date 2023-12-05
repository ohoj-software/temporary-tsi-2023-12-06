// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI

struct ContentView: View {
    @Binding var text: String

    var body: some View {
        TextEditor(text: $text)
    }
}

#Preview {
    ContentView(text: .constant("Foo"))
}
