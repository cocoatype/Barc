//  Created by Geoff Pado on 8/15/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import Foundation

public struct Code: Identifiable, Sendable {
    public let name: String
    public let value: CodeValue
    public let triggers: [any Trigger]

    public var id: String { value.id }

    public init(name: String, value: CodeValue, triggers: [any Trigger]) {
        self.name = name
        self.value = value
        self.triggers = triggers
    }

    public static func qr(name: String, value: String, correctionLevel: QRCodeValue.CorrectionLevel) -> Code {
        Code(name: name, value: .qr(value: value, correctionLevel: correctionLevel), triggers: [])
    }

    public static func ean(name: String, value: String) throws -> Code {
        return try Code(name: name, value: .ean(value: value), triggers: [])
    }
}

public enum CodeValue: Identifiable, Sendable {
    case qr(QRCodeValue)
    case ean(EANCodeValue)

    public static func qr(value: String, correctionLevel: QRCodeValue.CorrectionLevel) -> CodeValue {
        return .qr(QRCodeValue(string: value, correctionLevel: correctionLevel))
    }

    public static func ean(value: String) throws -> CodeValue {
        let parser = EANPayloadParser()
        return try .ean(EANCodeValue(payload: parser.payload(for: value)))
    }

    public var id: String {
        switch self {
        case .qr(let value): String(describing: value.id)
        case .ean(let value): String(describing: value.id)
        }
    }
}

public struct QRCodeValue: Identifiable, Sendable {
    public let payload: Payload
    public let correctionLevel: CorrectionLevel

    public var id: Payload.ID { payload.id }

    public init(payload: Payload, correctionLevel: CorrectionLevel) {
        self.payload = payload
        self.correctionLevel = correctionLevel
    }

    public init(string: String, correctionLevel: CorrectionLevel) {
        self.init(payload: Payload(string: string), correctionLevel: correctionLevel)
    }

    public enum CorrectionLevel: Sendable {
        case l, m, q, h
    }

    public struct Payload: ExpressibleByStringLiteral, Identifiable, Sendable {
        public let data: Data
        public var id: Data { data }

        public init(data: Data) {
            self.data = data
        }

        init(string value: String) {
            self.init(data: value.data(using: .utf8) ?? Data())
        }

        public init(stringLiteral value: String) {
            self.init(string: value)
        }
    }

    enum MaskPattern {
        case pattern1, pattern2, pattern3, pattern4, pattern5, pattern6, pattern7, pattern8
    }
}

public protocol Trigger: Sendable {}

struct LocationTrigger: Trigger {}
struct DateTrigger: Trigger {}
