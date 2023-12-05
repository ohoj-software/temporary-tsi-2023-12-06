// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI

struct ContentView: View {
    @Binding var document: DocumentWithWelcomeScreenDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

#Preview {
    ContentView(document: .constant(DocumentWithWelcomeScreenDocument()))
}
