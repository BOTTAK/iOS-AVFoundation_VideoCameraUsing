//
//  PermissionsManager.swift
//  VideoJournal
//
//  Created by Пенькевич Василий on 11/7/19.
//  Copyright © 2019 Пенькевич Василий. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

final class PermissionsManager: NSObject {
    
    enum PermissionType {
        case audio
        case video
        case album
        
        var errorMessage: String {
            switch self {
            case . audio:
                return "Please enable access to microphone"
            case .video:
                return "Please enable access to camera"
            case .album:
                return "Access to Photos Library not Granted"
            }
        }
    }
    
    class func checkIfCameraIsAvailable() -> CameraState {
        let deviceHasCamera = UIImagePickerController.isCameraDeviceAvailable(UIImagePickerController.CameraDevice.rear) || UIImagePickerController.isCameraDeviceAvailable(UIImagePickerController.CameraDevice.front)
        if deviceHasCamera {
            let authorizationStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            let userAgreed = authorizationStatus == .authorized
            if userAgreed {
                return .ready
            } else if authorizationStatus == AVAuthorizationStatus.notDetermined {
                return .notDetermined
            } else {
                return .accessDenied
            }
        } else {
            return .noDeviceFound
        }
    }
    
    class func checkMicrophoneAccess() -> AVAudioSession.RecordPermission {
        return AVAudioSession.sharedInstance().recordPermission
    }
    
    class func requestVideoCaptureAccess(completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: { (granted:Bool) -> Void in
            completion(granted)
        })
    }
    
    class func requestAudioRecordAccess(completion: @escaping (Bool) -> Void) {
        AVAudioSession.sharedInstance().requestRecordPermission { (granted) in
            completion(granted)
        }
    }
    
}
