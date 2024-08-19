//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import ErrorHandling
import SwiftUI

public struct RepositoryUpdateModifier: ViewModifier {
    let updateTask: Task<Void, Never>
    init(repository: any BarcodeRepository, action: @escaping ([Code]) -> Void) {
        let updates = repository.subscribeToUpdates()
        updateTask = Task {
            for await update in updates {
                action(update)
            }
        }
    }

    public func body(content: Content) -> some View { content }
}

public extension View {
    func onUpdate(
        to repository: any BarcodeRepository,
        perform action: @escaping ([Code]) -> Void
    ) -> ModifiedContent<Self, RepositoryUpdateModifier> {
        return self.modifier(RepositoryUpdateModifier(repository: repository, action: action))
    }
}
