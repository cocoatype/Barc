//  Created by Geoff Pado on 11/5/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

struct EANDigit {
    static let d0 = EANDigit(l: 0b0001101, g: 0b0100111, r: 0b1110010, sectionMap: 0b000000)
    static let d1 = EANDigit(l: 0b0011001, g: 0b0110011, r: 0b1100110, sectionMap: 0b001011)
    static let d2 = EANDigit(l: 0b0010011, g: 0b0011011, r: 0b1101100, sectionMap: 0b001101)
    static let d3 = EANDigit(l: 0b0111101, g: 0b0100001, r: 0b1000010, sectionMap: 0b001110)
    static let d4 = EANDigit(l: 0b0100011, g: 0b0011101, r: 0b1011100, sectionMap: 0b010011)
    static let d5 = EANDigit(l: 0b0110001, g: 0b0111001, r: 0b1001110, sectionMap: 0b011001)
    static let d6 = EANDigit(l: 0b0101111, g: 0b0000101, r: 0b1010000, sectionMap: 0b011100)
    static let d7 = EANDigit(l: 0b0111011, g: 0b0010001, r: 0b1000100, sectionMap: 0b010101)
    static let d8 = EANDigit(l: 0b0110111, g: 0b0001001, r: 0b1001000, sectionMap: 0b010110)
    static let d9 = EANDigit(l: 0b0001011, g: 0b0010111, r: 0b1110100, sectionMap: 0b011010)

    let l: [Bool]
    let g: [Bool]
    let r: [Bool]
    let sectionMap: [EANSection]
    init(l: Int, g: Int, r: Int, sectionMap: Int) {
        self.l = l.encoded
        self.g = g.encoded
        self.r = r.encoded
        self.sectionMap = sectionMap.sectionMap
    }

    func encodedValue(for section: EANSection) -> [Bool] {
        switch section {
        case .l: self.l
        case .g: self.g
        case .r: self.r
        }
    }
}

fileprivate extension Int {
    func binaryBoolValues(count: Int) -> [Bool] {
        var int = self
        var array = [Bool]()
        for _ in 0..<count {
            array.insert(int % 2 == 1, at: 0)
            int /= 2
        }
        return array
    }

    var encoded: [Bool] {
        binaryBoolValues(count: 7)
    }

    var sectionMap: [EANSection] {
        binaryBoolValues(count: 6).map { $0 ? .g : .l }
    }
}
