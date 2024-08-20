//  Created by Geoff Pado on 8/20/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Barcodes
import MapKit

struct LocationSearchCompleter {
    typealias Stream = AsyncStream<[LocationSearchCompletion]>
    private let continuation: Stream.Continuation
    let results: Stream

    private let underlyingCompleter: MKLocalSearchCompleter
    private let underlyingCompleterDelegate: UnderlyingCompleterDelegate

    init() {
        (results, continuation) = Stream.makeStream()
        underlyingCompleterDelegate = UnderlyingCompleterDelegate(continuation: continuation)
        underlyingCompleter = MKLocalSearchCompleter()

        underlyingCompleter.delegate = underlyingCompleterDelegate
    }

    private class UnderlyingCompleterDelegate: NSObject, MKLocalSearchCompleterDelegate {
        let continuation: Stream.Continuation

        init(continuation: Stream.Continuation) {
            self.continuation = continuation
        }

        private let mapper = LocationSearchCompletionMapper()
        func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
            let completions = completer.results.map(mapper.completion(from:))
            continuation.yield(completions)
        }
    }
}
