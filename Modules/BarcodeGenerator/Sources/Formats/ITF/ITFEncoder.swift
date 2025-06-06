//  Created by Geoff Pado on 6/5/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import BarcBarcodes

struct ITFEncoder {
    func encodedValue(from payload: ITFCodeValue.Payload) -> [Bool] {
        var elements = payload.elements
        if elements.count % 2 != 0 {
            elements.insert(.e0, at: 0)
        }

        let pairs = elements.pairs
        let modulePairs = pairs.map { pair in
            return (modules(for: pair.0), modules(for: pair.1))
        }

        let encodedPayload = modulePairs.flatMap { modulePair in
            let barModules = modulePair.0
            let spaceModules = modulePair.1
            let zipped = zip(barModules, spaceModules)
            return zipped.flatMap { zippedPair -> [Bool] in
                let encodedBar = switch zippedPair.0 {
                case .narrow: [true]
                case .wide: [true, true, true]
                }
                let encodedSpace = switch zippedPair.1 {
                case .narrow: [false]
                case .wide: [false, false, false]
                }
                return encodedBar + encodedSpace
            }
        }

        let startValue = [true, false, true, false]
        let stopValue = [true, true, true, false, true]

        return startValue + encodedPayload + stopValue
    }

    private func modules(for element: ITFElement) -> [Module] {
        switch element {
        case .e0: [.narrow, .narrow, .wide, .wide, .narrow]
        case .e1: [.wide, .narrow, .narrow, .narrow, .wide]
        case .e2: [.narrow, .wide, .narrow, .narrow, .wide]
        case .e3: [.wide, .wide, .narrow, .narrow, .narrow]
        case .e4: [.narrow, .narrow, .wide, .narrow, .wide]
        case .e5: [.wide, .narrow, .wide, .narrow, .narrow]
        case .e6: [.narrow, .wide, .wide, .narrow, .narrow]
        case .e7: [.narrow, .narrow, .narrow, .wide, .wide]
        case .e8: [.wide, .narrow, .narrow, .wide, .narrow]
        case .e9: [.narrow, .wide, .narrow, .wide, .narrow]
        }
    }

    private enum Module {
        case narrow, wide
    }
}

private extension Array {
    var pairs: [(Element, Element)] {
        var copy = self
        var pairs = [(Element, Element)]()
        while copy.count >= 2 {
            pairs.append((copy[0], copy[1]))
            copy.removeFirst(2)
        }

        return pairs
    }
}
