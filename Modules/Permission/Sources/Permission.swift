//  Created by Geoff Pado on 9/6/24.
//  Copyright © 2024 Cocoatype, LLC. All rights reserved.

public let cameraPermissionRequester: any CameraPermissionRequester = DeviceCameraPermissionRequester()
@MainActor public let locationPermissionRequester: any LocationPermissionRequester = CoreLocationPermissionRequester()
