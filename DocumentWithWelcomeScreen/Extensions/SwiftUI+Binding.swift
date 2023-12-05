// Copyright 2023 ohoj Software GmbH. All rights reserved.

import SwiftUI

extension Binding where Value == Bool {
    // Allows you to use $viewModel.someBoolean.not to get the inverse of `someBoolean`
    var not: Binding<Value> {
        Binding<Value>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }
}
