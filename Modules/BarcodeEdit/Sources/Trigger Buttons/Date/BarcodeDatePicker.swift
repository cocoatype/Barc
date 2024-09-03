//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct BarcodeDatePicker: View {
    @Binding private var date: Date

    init(date: Binding<Date>) {
        _date = date
    }

    var body: some View {
        DatePicker("Date", selection: $date)
            .datePickerStyle(.graphical)
    }
}
