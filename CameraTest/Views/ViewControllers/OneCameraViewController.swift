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
    
    @IBOutlet weak var auidoOneButton: UIButton!
    
    @IBOutlet weak var audioTwoButton: UIButton!
    
    @IBOutlet weak var editorButton: UIButton!
    
    @IBOutlet weak var effectOneButton: UIButton!
    
    @IBOutlet weak var effectTwoButton: UIButton!
    
    @IBOutlet weak var lockOrientationButton: UIButton!
    
    @IBOutlet weak var galleryButton: UIButton!
    
    @IBOutlet weak var microphoneButton: UIButton!
    
    @IBOutlet weak var negaviteOneButton: UIButton!
    
    @IBOutlet weak var negativeTwoButton: UIButton!
    
    @IBOutlet weak var orientationButton: UIButton!
    
    @IBOutlet weak var photoCameraButton: UIButton!
    
    @IBOutlet weak var proModeButton: UIButton!
    
    @IBOutlet weak var rotateButton: UIButton!
    
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var videoOneButton: UIButton!
    
    @IBOutlet weak var videoTwoButton: UIButton!
    
    @IBOutlet weak var cameraMode: UISegmentedControl!
    
    
    
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
        flashButtonEnabled.imageView?.contentMode = .scaleAspectFill
//        flashButtonEnabled.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flashButtonEnabled.setImage((UIImage(named: "Vector")), for: .normal)
        setFlashImage(state: cameraManager.changeIlluminationMode())
    }
    
    @IBAction func lockRorationButton(_ sender: Any) {
        lockOrientationButton.imageView?.contentMode = .scaleAspectFill
        lockOrientationButton.setImage(UIImage(named: "Locked"), for: .normal)
        let vc: ImageViewController? = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as? ImageViewController
        if let validVC: ImageViewController = vc,
            let capturedImage = captureImage {
            validVC.image = captureImage
            self.navigationController?.pushViewController(validVC, animated: true)
        }
    }
    
    @IBAction func galeryButton(_ sender: Any) {
        galleryButton.imageView?.contentMode = .scaleAspectFill
//        galleryButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        galleryButton.setImage(UIImage(named: "Gallery"), for: .normal)
    }
    
    @IBAction func editorButton(_ sender: Any) {
        editorButton.imageView?.contentMode = .scaleAspectFill
        editorButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        editorButton.setImage(UIImage(named: "Editor"), for: .normal)
    }
    
    @IBAction func startButton(_ sender: Any) {
        startButton.imageView?.contentMode = .scaleAspectFill
        startButton.setImage(UIImage(named: "Start"), for: .normal)
         if cameraManager.cameraOutputMode == .video {
                   if !startButton.isSelected {
                       cameraManager.startRecording()
                   } else {
                       cameraManager.pauseRecording()
                   }
               } else {
                   print("need photo mode")
               }
        
    }

    
    @IBAction func stopButton(_ sender: Any) {
        stopButton.imageView?.contentMode = .scaleAspectFill
//        stopButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        stopButton.setImage(UIImage(named: "Stop"), for: .normal)
        cameraManager.stopRecording(discardVideo: true)
        startActivityIndicator()
    }
    
    @IBAction func orientationButton(_ sender: Any) {
        orientationButton.imageView?.contentMode = .scaleAspectFill
//        orientationButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        orientationButton.setImage(UIImage(named: "Rotate"), for: .normal)
    }
    
    @IBAction func videoOneButton(_ sender: Any) {
        videoOneButton.imageView?.contentMode = .scaleAspectFill
//        videoOneButton.imageEdgeInsets = UIEdgeInsets(top:30, left: 30, bottom: 30, right: 30)
        videoOneButton.setImage(UIImage(named: "Video"), for: .normal)
    }
    
    @IBAction func audioOneButton(_ sender: Any) {
        auidoOneButton.imageView?.contentMode = .scaleAspectFill
//        auidoOneButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        auidoOneButton.setImage(UIImage(named: "Audio"), for: .normal)
    }
    
    @IBAction func effectOneButton(_ sender: Any) {
        effectOneButton.imageView?.contentMode = .scaleAspectFill
//        effectOneButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        effectOneButton.setImage(UIImage(named: "Effect"), for: .normal)
    }
    
    @IBAction func negativOneButton(_ sender: Any) {
        negaviteOneButton.imageView?.contentMode = .scaleAspectFill
//        negaviteOneButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        negaviteOneButton.setImage(UIImage(named: "Negativ"), for: .normal)
    }
    
    @IBAction func videoTwoButton(_ sender: Any) {
        videoTwoButton.imageView?.contentMode = .scaleAspectFill
//        videoTwoButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        videoTwoButton.setImage(UIImage(named: "Video"), for: .normal)
    }
    
    @IBAction func audioTwoButton(_ sender: Any) {
        audioTwoButton.imageView?.contentMode = .scaleAspectFill
//        audioTwoButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        audioTwoButton.setImage(UIImage(named: "Audio"), for: .normal)
    }
    
    @IBAction func effectTwoButton(_ sender: Any) {
        effectTwoButton.imageView?.contentMode = .scaleAspectFill
//        effectTwoButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        effectTwoButton.setImage(UIImage(named: "Effect"), for: .normal)
    }
    
    @IBAction func negativTwoButton(_ sender: Any) {
        negativeTwoButton.imageView?.contentMode = .scaleAspectFill
//        negativeTwoButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        negativeTwoButton.setImage(UIImage(named: "Negativ"), for: .normal)
    }
    
    
    //MARK: TopBar Panel Function
    @IBAction func rotateButton(_ sender: Any) {
        rotateButton.imageView?.contentMode = .scaleAspectFill
//        rotateButton.imageEdgeInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        rotateButton.setImage(UIImage(named: "RotateMode"), for: .normal)
    }
    
    @IBAction func proModeButton(_ sender: Any) {
        proModeButton.imageView?.contentMode = .scaleAspectFill
//        proModeButton.imageEdgeInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        proModeButton.setImage(UIImage(named: "ProMode"), for: .normal)
    }
    
    @IBAction func photoCameraButton(_ sender: Any) {
        photoCameraButton.imageView?.contentMode = .scaleAspectFill
//        photoCameraButton.imageEdgeInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        photoCameraButton.setImage(UIImage(named: "Photo"), for: .normal)
    }
    
    @IBAction func microphoneButton(_ sender: Any) {
        microphoneButton.imageView?.contentMode = .scaleAspectFill
//        microphoneButton.imageEdgeInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        microphoneButton.setImage(UIImage(named: "Microphone"), for: .normal)
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        settingButton.imageView?.contentMode = .scaleAspectFill
//        settingButton.imageEdgeInsets = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        settingButton.setImage(UIImage(named: "Settings"), for: .normal)
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
            flashButtonEnabled.isEnabled = flash
        } else {
            flashButtonEnabled.isEnabled = false
        }
        orientationButtob.isEnabled = cameraManager.hasFrontCamera
        orientationButtob.isHidden = !cameraManager.canChangeCameraPosition
        cameraMode.selectedSegmentIndex = cameraManager.cameraOutputMode.rawValue
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
            stopButton.isHidden = false
//            previewImageView.isHidden = true
            stopButton.isEnabled = cameraManager.isRecordingSessionInProgress
        case .stillImage:
            stopButton.isHidden = true
            timerLabel.isHidden = true
            break
        }
        startButton.isSelected = false
        startButton.isEnabled = true
        
        handleButtonStates()
    }
    
    private func showAlert(title: String, message: String,completion: (()->())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: completion)
    }
    
    
    private func setFlashImage(state: CameraFlashMode) {
        switch state {
        case .off:
            flashButtonEnabled.setImage(UIImage(named: "icoFlashOff"), for: .normal)
        case .on :
            flashButtonEnabled.setImage(UIImage(named: "icoFlashOn"), for: .normal)
        case .auto:
            flashButtonEnabled.setImage(UIImage(named: "icoFlashAuto"), for: .normal)
        }
    }
    
    
    private func setupUI() {
        cameraView?.contentMode = .scaleToFill
        startButton.isSelected = false
        stopButton.isEnabled = false
    }
    
    private func positionCameraPreview() {
//                    previewLayer?.videoGravity = .resizeAspectFill
//                    previewLayer?.frame = videoCaptureView.bounds
//                    self.previewLayer?.position = CGPoint(x: self.videoCaptureView.bounds.midX, y: self.videoCaptureView.bounds.midY)
//                cameraPreviewView?.previewLayer.videoGravity = .resizeAspectFill
//                cameraPreviewView?.frame = videoCaptureView.bounds
        
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
        effectOneButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
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
            startButton.isEnabled = true
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
        startButton.isSelected = true
        stopButton.isSelected = true
        cameraManager.customOrientation()
        handleButtonStates()
    }
    
    func didPauseRecording(withIndividualVideoUrls videoUrls: [URL]) {
        DispatchQueue.main.async {
            self.handleButtonStates()
            self.startButton.isSelected = false
            self.startButton.isSelected = false
        }
    }
    
    func didExportVideo(with outputUrl: URL?,error: Error?) {
        DispatchQueue.main.async {
            self.stopButton.isEnabled = false
            self.startButton.isSelected = false
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
            self.stopButton.isEnabled = false
            self.startButton.isSelected = false
            self.handleButtonStates()
            self.stopActivityIndicator()
            
            guard var intermediateVideoUrls = videoUrls else {
                                self.cameraManager.resumeSession(completion: {
                                    DispatchQueue.main.async {
                                        self.updateUIForCameraMode(mode: self.cameraManager.cameraOutputMode)
                                    }
                                })
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
                                        self.cameraManager.deleteVideoAtIndex(index: index)
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
