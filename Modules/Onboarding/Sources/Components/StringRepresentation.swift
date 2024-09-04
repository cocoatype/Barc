//  Created by Geoff Pado on 9/3/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

enum StringRepresentation {
    case key(LocalizedStringKey)
    case string(String)

    var text: Text {
        switch self {
        case .key(let localizedStringKey):
            return Text(localizedStringKey, bundle: .module)
        case .string(let string):
            return Text(string)
        }
    }
}
