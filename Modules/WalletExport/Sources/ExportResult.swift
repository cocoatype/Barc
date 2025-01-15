//  Created by Geoff Pado on 10/22/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import PassKit

public enum ExportResult: Sendable {
    case success
    case needsReview(ExportedPass)
    case cancelled
    case error(Error)
    case unpurchased

    init(passResult: PKPassLibraryAddPassesStatus, for pass: ExportedPass) {
        self = switch passResult {
        case .didAddPasses: .success
        case .shouldReviewPasses: .needsReview(pass)
        case .didCancelAddPasses: .cancelled
        @unknown default: .cancelled
        }
    }

    public var pass: ExportedPass? {
        switch self {
        case .needsReview(let pass): pass
        case .success, .cancelled, .error, .unpurchased: nil
        }
    }

    public var error: (any Error)? {
        switch self {
        case .error(let error): error
        case .success, .needsReview, .cancelled, .unpurchased: nil
        }
    }
}

extension Optional<ExportResult> {
    var error: (any Error)? {
        get {
            self?.error ?? nil
        }
        set {
            if let newValue {
                self = .error(newValue)
            } else {
                self = nil
            }
        }
    }

    var pass: ExportedPass? {
        get {
            self?.pass ?? nil
        }
        set {
            if let newValue {
                self = .needsReview(newValue)
            } else {
                self = nil
            }
        }
    }

    var isUnpurchased: Bool {
        get {
            switch self {
            case .unpurchased: true
            case .success, .needsReview, .cancelled, .error, .none: false
            }
        }
        set {
            if newValue == false { self = nil }
        }
    }
}
