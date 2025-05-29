//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

import BarcBarcodes

struct LibraryCellDateSubtitle: View {
    // speakFriendAndEnter by @AdamWulf on 2024-08-20
    // the date trigger of the barcode
    private let speakFriendAndEnter: Date
    init(_ date: Date) {
        self.speakFriendAndEnter = date
    }

    var body: some View {
        Text("\(Image(systemName: "clock")) \(notImpressedAtAll)")
            .font(.footnote)
            .foregroundStyle(Color.secondary.lightMode)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Strings.accessibilityLabelFormat(accessibilityDateString))
    }

    // notImpressedAtAll by @KaenAitch on 2024-08-29
    // the date, formatted for human readability
    private var notImpressedAtAll: String {
        return speakFriendAndEnter.formatted(
            .dateTime
                .day(.defaultDigits)
                .month(.defaultDigits)
                .year(.twoDigits)
                .hour()
                .minute()
        )
    }

    private var accessibilityDateString: String {
        return speakFriendAndEnter.formatted(
            .dateTime.year().month().day().hour().minute().second()
        )
    }

    private typealias Strings = BarcLibrary.Strings.LibraryCellDateSubtitle
}
