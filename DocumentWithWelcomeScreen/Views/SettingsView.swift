// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI

struct SettingsView: View {

    @AppStorage(AppConstants.hideWindowWelcome.rawValue) private var hideWelcomeWindow = false

    var body: some View {
        VStack {
            Toggle(isOn: $hideWelcomeWindow.not, label: {
                Text("Show welcome window")
            })
        }
        .padding()
        .frame(width: 540, height: 200)
    }

}


#Preview {
    SettingsView()
}
