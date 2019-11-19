//
//  PlayerViewController.swift
//  VideoJournal
//
//  Created by Пенькевич Василий on 11/7/19.
//  Copyright © 2019 Пенькевич Василий. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PlayerViewController: AVPlayerViewController {
    
    private var didSave = false
    var videoUrl: URL?
    var shouldAllowSave: Bool = false
    var fileManager = CameraFileManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let videoUrl = videoUrl else { return }
        self.player = AVPlayer(url: videoUrl)
        allowsPictureInPicturePlayback = false
        showsPlaybackControls = true

        NotificationCenter.default.addObserver(self , selector: #selector(handleNotification), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
    @objc func handleNotification() {
        if !didSave && shouldAllowSave && !UserDefaultsHandler.shouldSaveMedia() {
            let alertController = UIAlertController(title: "Save?", message: "Do you want to save this video?", preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel))
            
            alertController.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { (action) in
                self.saveToLibrary()
            }))
            
            DispatchQueue.main.async {
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    private func saveToLibrary() {
        guard let videoUrl = videoUrl else { return }
        CameraManager.saveVideoToAlbum(outputPath: videoUrl,completion: { (success) in
            self.didSaveVideo(success: success)
            self.didSave = success
        })
        addToSavedVideosFolder(url: videoUrl)
    }
    
    @objc private func goToHomePage() {
        navigationController?.navigationBar.isHidden = false
//        navigationController?.hidesBarsOnTap = false
        if shouldAllowSave{
            self.navigationController?.popToRootViewController(animated: true)
        }
        else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func didSaveVideo(success: Bool) {
        let title = success ? "Success": "Save Failed"
        let message = success ? "Video saved successfully" : "Could Not Save Video"
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {(action) in
            self.goToHomePage()
        })
        DispatchQueue.main.async {
            self.present(alertVC, animated: true)
        }
    }
    
    func addToSavedVideosFolder(url: URL) {
        guard let savedVideosFolder = fileManager.fetchSavedMergedVideosDirectory(), let videoUrl = videoUrl else {
            print("Could not fetch saved videos folder.")
            return
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        let fileUrl = savedVideosFolder.appendingPathComponent("\(dateString).mov")
        let videoData = NSData(contentsOf: videoUrl)
        videoData?.write(to: fileUrl, atomically: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
