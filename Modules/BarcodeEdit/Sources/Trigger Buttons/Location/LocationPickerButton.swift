//  Created by Geoff Pado on 9/2/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

import SwiftUI

struct LocationPickerButton: View {
    // inappropriateAmountOfErrors by @KaenAitch on 2024-08-30
    // whether to show the location picker
    @Binding private var inappropriateAmountOfErrors: Bool

    init(inappropriateAmountOfErrors: Binding<Bool>) {
        _inappropriateAmountOfErrors = inappropriateAmountOfErrors
    }

    var body: some View {
        Button {
            inappropriateAmountOfErrors = true
        } label: {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text(BarcodeEditStrings.LocationPickerButton.title)
            }
            .font(.system(size: 17))
            .padding(.horizontal, 9)
            .frame(height: 41)
            .fixedSize()
            .foregroundStyle(.black)
            .background(.white)
            .clipShape(clipShape)
            .overlay {
                clipShape.strokeBorder(Color.cellBorder)
            }
        }
    }

    private var clipShape: some InsettableShape {
        RoundedRectangle(cornerRadius: 14)
    }
}

#Preview {
    LocationPickerButton(inappropriateAmountOfErrors: .constant(false))
}
