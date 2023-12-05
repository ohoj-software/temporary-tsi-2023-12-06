// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI

struct WelcomeView: View {

    @AppStorage(AppConstants.hideWindowWelcome.rawValue) private var hideWelcomeWindow = false

    var body: some View {
        VStack {
            Text("Welcome")

            Toggle(isOn: $hideWelcomeWindow.not, label: {
                Text("Show welcome window")
            })
        }
    }
}

#Preview {
    WelcomeView()
}
