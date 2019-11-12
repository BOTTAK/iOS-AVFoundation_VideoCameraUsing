//
//  OneCameraViewController.swift
//  CameraTest
//
//  Created by Пенькевич Василий on 11/8/19.
//  Copyright © 2019 Пенькевич Василий. All rights reserved.
//

import UIKit

class OneCameraViewController: UIViewController {
    
    //MARK: Outltes
    @IBOutlet weak var cameraView: UIView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var galeryLabel: UILabel!
    
    @IBOutlet weak var editorLabel: UILabel!
    
    @IBOutlet weak var stopLabel: UILabel!
    
    @IBOutlet weak var camera: UILabel!
    
    @IBOutlet weak var videoOneLabel: UILabel!
    
    @IBOutlet weak var audioOneLabel: UILabel!
    
    @IBOutlet weak var effectOneLabel: UILabel!
    
    @IBOutlet weak var negativOneLabel: UILabel!
    
    @IBOutlet weak var videoTwoLabel: UILabel!
    
    @IBOutlet weak var audioTwoLabel: UILabel!
    
    @IBOutlet weak var effectTwoLabel: UILabel!
    
    @IBOutlet weak var negativTwoLabel: UILabel!
    
    @IBOutlet weak var flashButtonEnabled: UIButton!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var orientationButtob: UIButton!
    
    
    
    //MARK: Top Bar Panel Labels
    @IBOutlet weak var rotateLabel: UILabel!
    
    @IBOutlet weak var proModeLabel: UILabel!
    
    @IBOutlet weak var photoCameraLabel: UILabel!
    
    @IBOutlet weak var microphoneLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    //MARK: Variables
    let cameraManager = CameraManager.sharedInstance
    
    var galleryView: GalleryView?
    private var activitiIndicator: UIActivityIndicatorView?
    private var captureImage: UIImage?
    
    
    
    
    //MARK: Function
    @IBAction func flashButtonEnabled(_ sender: Any) {
        let image = UIImage(named: "Vector")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func lockRorationButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func galeryButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func editorButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func startButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func stopButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func orientationButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func videoOneButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func audioOneButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func effectOneButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func negativOneButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func videoTwoButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func audioTwoButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func effectTwoButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func negativTwoButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    
    //MARK: TopBar Panel Function
    @IBAction func rotateButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func proModeButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func photoCameraButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func microphoneButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        let image = UIImage(named: "")
        let button = UIButton()
        button.setImage(image, for: .normal)
    }
    
    private func addVideoPreviewView(mode: CameraOutputMode?) {
        guard let cameraMode = (mode != nil) ? mode : CameraOutputMode(rawValue: UserDefaultsHandler.defaultOutputMode()) else { return }
        cameraManager.addVideoPreviewToView(cameraView, cameraMode: cameraMode,completion: {
            DispatchQueue.main.sync {
                self.updateUIForCameraMode(mode: self.cameraManager.cameraOutputMode)
//                self.setFlashImage(state: self.cameraManager.illuminationState)
            }
        })
    }
    
    private func handleButtonStates() {
        if let flash = cameraManager.hasTorchOrFlash {
//            flashButtonEnabled.isEnabled = flash
        } else {
//            flashButtonEnabled.isEnabled = false
        }
//        orientationButtob.isEnabled = cameraManager.hasFrontCamera
//        orientationButtob.isHidden = !cameraManager.canChangeCameraPosition
//        cameraModeControl.selectedSegmentIndex = cameraManager.cameraOutputMode.rawValue
    }
    
    func cameraAccessDenied(type: PermissionsManager.PermissionType? = nil) {
        let message = type?.errorMessage ?? "Please enable access to camera and microphone."
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Permissions needed", message: message, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Go to Settings", style: UIAlertAction.Style.default, handler: { (action) in
                guard let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) else { return }
                
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }))
            self.present(alertController, animated: true)
        }
    }
    
    
    private func changeCameraMode(mode: CameraOutputMode) {
        cameraManager.cameraOutputMode = mode
        updateUIForCameraMode(mode: cameraManager.cameraOutputMode)
    }
    
    private func updateUIForCameraMode(mode: CameraOutputMode) {
        switch mode {
        case .video:
//            stopButton.isHidden = false
//            previewImageView.isHidden = true
            stopButton.isEnabled = cameraManager.isRecordingSessionInProgress
        case .stillImage:
//            stopButton.isHidden = true
//            timerLabel.isHidden = true
            break
        }
//        startButton.isSelected = false
//        startButton.isEnabled = true
        
        handleButtonStates()
    }
    
    private func showAlert(title: String, message: String,completion: (()->())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: completion)
    }
    
    
//    private func setFlashImage(state: CameraFlashMode) {
//        switch state {
//        case .off:
//            flashButtonEnabled.setImage(UIImage(named: "icoFlashOff"), for: .normal)
//        case .on :
//            flashButtonEnabled.setImage(UIImage(named: "icoFlashOn"), for: .normal)
//        case .auto:
//            flashButtonEnabled.setImage(UIImage(named: "icoFlashAuto"), for: .normal)
//        }
//    }
    
    
    private func setupUI() {
        cameraView?.contentMode = .scaleToFill
//        startButton.isSelected = false
//        stopButton.isEnabled = false
    }
    
    private func positionCameraPreview() {
        //            previewLayer?.videoGravity = .resizeAspectFill
        //            previewLayer?.frame = videoCaptureView.bounds
        //            self.previewLayer?.position = CGPoint(x: self.videoCaptureView.bounds.midX, y: self.videoCaptureView.bounds.midY)
        //        cameraPreviewView?.previewLayer.videoGravity = .resizeAspectFill
        //        cameraPreviewView?.frame = videoCaptureView.bounds
        
    }
    
    private func showPlayerScreen(with videoUrl: URL) {
        guard let playerVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController else { return }
        playerVC.videoUrl = videoUrl
        playerVC.shouldAllowSave = true
        
        //            navigationController?.pushViewController(playerVC, animated: true)
        present(playerVC, animated: true)
    }
    
    func startActivityIndicator() {
        guard let spinner = activitiIndicator else {
            activitiIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activitiIndicator?.frame = UIScreen.main.bounds
            activitiIndicator?.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
            activitiIndicator?.hidesWhenStopped = true
            activitiIndicator?.backgroundColor = UIColor(white: 0, alpha: 0.3)
            self.view.addSubview(activitiIndicator!)
            view.bringSubviewToFront(activitiIndicator!)
            activitiIndicator?.startAnimating()
            return
        }
        spinner.frame = UIScreen.main.bounds
        spinner.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        
        view.addSubview(spinner)
        view.bringSubviewToFront(spinner)
        spinner.startAnimating()
    }
    
    func stopActivityIndicator() {
        activitiIndicator?.stopAnimating()
        activitiIndicator?.removeFromSuperview()
        
    }
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cameraManager.writeFilesToPhoneLibrary = true
        if cameraManager.isCameraReady {
            addVideoPreviewView(mode: nil)
            cameraManager.recordingDelegate = self
            cameraManager.imageCaptureDelegate = self
        } else {
            
            cameraManager.requestVideoRecordingPermissions { [weak self] (accessGranted) in
                guard let `self` = self else { return }
                if accessGranted {
                    
                    self.addVideoPreviewView(mode: nil)
                    self.cameraManager.recordingDelegate = self
                    self.cameraManager.imageCaptureDelegate = self
                } else {
                    self.cameraAccessDenied(type: PermissionsManager.PermissionType.video)
                    //Hide Buttons
                }
            }
        }
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            positionCameraPreview()
        }
        
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            timerLabel.isHidden = true
//            startButton.isEnabled = true
            setupUI()
            cameraManager.resumeSession(){
                DispatchQueue.main.async {
                    self.updateUIForCameraMode(mode: self.cameraManager.cameraOutputMode)
                }
            }
        }
        
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            cameraManager.stopAndRemoveSession()
            activitiIndicator = nil
        }
        
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            super.viewWillTransition(to: size, with: coordinator)
            coordinator.animate(alongsideTransition: { (context) in
                if let galleryView = self.galleryView {
                    if self.view.subviews.contains(galleryView) {
                        galleryView.frame = CGRect(x: 0, y: size.height-240, width: size.width, height: 240)
                        self.galleryView = galleryView
                    }
                }
                if let activitiIndicator = self.activitiIndicator {
                    if self.view.subviews.contains(activitiIndicator) {
                        activitiIndicator.frame = UIScreen.main.bounds
                        activitiIndicator.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
                    }
                }
                
            }) { (context) in
                
            }
        }
        
    }
    



extension OneCameraViewController: CameraMangerRecordingDelegate, CameraPhotoCaptureDelegate {

    
    func didStartRecording() {
//        startButton.isSelected = true
//        stopButton.isEnabled = true
        handleButtonStates()
    }
    
    func didPauseRecording(withIndividualVideoUrls videoUrls: [URL]) {
        DispatchQueue.main.async {
            self.handleButtonStates()
//            self.startButton.isSelected = false
        }
    }
    
    func didExportVideo(with outputUrl: URL?,error: Error?) {
        DispatchQueue.main.async {
//            self.stopButton.isEnabled = false
//            self.startButton.isSelected = false
            self.timerLabel.isHidden = true
            self.handleButtonStates()
            self.stopActivityIndicator()
            if let outputUrl = outputUrl {
                self.showPlayerScreen(with: outputUrl)
            } else {
                var errorDescription = ""
                if let error = error {
                    errorDescription = error.localizedDescription
                }
                self.showAlert(title: "Error", message: "Could not Export Video. \(errorDescription)", completion: nil)
            }
        }
    }
    
    func didUpdateRecordingDuration(timeString: String) {
        DispatchQueue.main.async {
            self.view.bringSubviewToFront(self.timerLabel)
            self.timerLabel.isHidden = false
            self.timerLabel.text = timeString
        }
    }
    
    func didStopRecording(withIndividualVideoUrls videoUrls: [URL]?) {
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.timerLabel.isHidden = true
//            self.stopButton.isEnabled = false
//            self.startButton.isSelected = false
            self.handleButtonStates()
            self.stopActivityIndicator()
            
            guard var intermediateVideoUrls = videoUrls else {
                //                self.cameraManager.resumeSession(completion: {
                //                    DispatchQueue.main.async {
                //                        self.updateUIForCameraMode(mode: self.cameraManager.cameraOutputMode)
                //                    }
                //                })
                return
            }
            
            let assetHandler = AssetHandler(withAssetUrls: intermediateVideoUrls, size: self.cameraManager.videoResolutionSize)
            var images = assetHandler.getImagesForAssets()
            let frame = CGRect(x: 0, y: self.view.bounds.height-240, width: self.view.bounds.width, height: 240)
            self.galleryView = GalleryView(frame: frame, images: images)
            
            self.galleryView?.didDeleteAssetBlock = { (index) in
                if index < intermediateVideoUrls.count {
                    intermediateVideoUrls.remove(at: index)
                    images.remove(at: index)
                    //                    self.cameraManager.deleteVideoAtIndex(index: index)
                }
            }
            
            self.galleryView?.didRearrangeAssetsBlock = { (fromIndex, toIndex)  in
                let temp = intermediateVideoUrls[fromIndex]
                
                if fromIndex < toIndex {
                    for item in fromIndex ..< toIndex {
                        intermediateVideoUrls[item] = intermediateVideoUrls[item+1]
                    }
                    intermediateVideoUrls[toIndex] = temp
                }
                else{
                    for item in (toIndex + 1...fromIndex).reversed() {
                        intermediateVideoUrls[item] = intermediateVideoUrls[item-1]
                    }
                }
                intermediateVideoUrls[toIndex] = temp
            }
            
            self.galleryView?.closeBlock = { [weak self] in
                guard let `self` = self else { return }
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else { return }
                    self.galleryView?.removeFromSuperview()
                }
                self.cameraManager.resumeSession(completion: {
                    DispatchQueue.main.async {
                        self.updateUIForCameraMode(mode: self.cameraManager.cameraOutputMode)
                    }
                })
            }
            
            self.galleryView?.progressBlock = { [weak self] in
                guard let `self` = self else { return }
                self.galleryView?.removeFromSuperview()
                self.startActivityIndicator()
                self.cameraManager.exportCompositeVideo(fromIndividualVideoUrls: intermediateVideoUrls, quality: self.cameraManager.videoExportQuality)
            }
            
            self.view.addSubview(self.galleryView!)
        }
    }
    
    private func discardCapturedImages() {
        self.galleryView?.removeFromSuperview()
    }
    
    func didCaptureImage(image: UIImage?, previewImage: UIImage?, error: Error?) {
        DispatchQueue.main.async {
            guard let image = image else {
                self.showAlert(title: "Error", message: "Could not Capture Image", completion: nil)
                return
            }
//            self.capturedImage = image
//            if let previewImage = previewImage {
//                self.previewImageView.isHidden = false
//                self.previewImageView.image = previewImage
//            } else {
//                self.previewImageView.isHidden = false
//                self.previewImageView.image = image
//            }
        }
    }
}
