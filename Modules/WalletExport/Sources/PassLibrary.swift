//  Created by Geoff Pado on 10/10/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit

protocol PassLibrary {
    func addPasses(_ passes: [PKPass]) async -> PKPassLibraryAddPassesStatus
}

extension PKPassLibrary: PassLibrary {}
