//  Created by Geoff Pado on 3/12/25.
//  Copyright © 2025 Cocoatype, LLC. All rights reserved.

import PhotosUI
import SwiftUI

//struct PhotoPicker: UIViewControllerRepresentable {
//    typealias UIViewControllerType = PHPickerViewController
//
//    @Binding private var pickerResult: PickerResult
//
//    init(pickerResult: Binding<PickerResult>) {
//        _pickerResult = pickerResult
//    }
//
//    func makeUIViewController(context: Context) -> PHPickerViewController {
//        var configuration = PHPickerConfiguration(photoLibrary: .shared())
//        configuration.filter = .images
//        configuration.selectionLimit = 1
//        let picker = PHPickerViewController(configuration: configuration)
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//
//    @Environment(\.dismiss) private var dismiss
//    func makeCoordinator() -> Coordinator {
//        Coordinator { result in
//            if let result {
//                pickerResult = .scanning(result)
//            } else {
//                dismiss()
//            }
//        }
//    }
//
//    class Coordinator: NSObject, PHPickerViewControllerDelegate {
//        private let selectionAction: (PHPickerResult?) -> Void
//
//        init(selectionAction: @escaping (PHPickerResult?) -> Void) {
//            self.selectionAction = selectionAction
//        }
//
//        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//            selectionAction(results.first)
//        }
//    }
//}
