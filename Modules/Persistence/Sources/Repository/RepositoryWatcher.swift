//  Created by Geoff Pado on 8/19/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes

class RepositoryWatcher {
    private var subscribers = [AsyncStream<[Code]>.Continuation]()

    func newSubscriber() -> AsyncStream<[Code]> {
        let (stream, continuation) = AsyncStream<[Code]>.makeStream()
        subscribers.append(continuation)
        return stream
    }

    func updateSubscribers(with newCodes: [Code]) {
        for subscriber in subscribers {
            subscriber.yield(newCodes)
        }
    }
}
