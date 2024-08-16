//  Created by Geoff Pado on 12/9/23.
//  Copyright © 2023 Cocoatype, LLC. All rights reserved.

import Barcodes
import SwiftData

@Model
final class BarcodeModel {
    var name: String
    var type: BarcodeModelType

    init(name: String, type: BarcodeModelType) {
        self.name = name
        self.type = type
    }
}

/*
 let type: BarcodeModelType
 let id: ID

 init(type: BarcodeModelType, id: ID) {
     self.type = type
     self.id = id
 }

 init(type: BarcodeModelType, uuid: UUID) {
     self.init(type: type, id: .uuid(uuid))
 }

 enum ID: Hashable, Sendable {
     case swiftData(PersistentIdentifier)
     case uuid(UUID)

     public func hash(into hasher: inout Hasher) {
         switch self {
         case .swiftData(let persistentIdentifier):
             hasher.combine(persistentIdentifier)
         case .uuid(let uuid):
             hasher.combine(uuid)
         }
     }
 }

 */
