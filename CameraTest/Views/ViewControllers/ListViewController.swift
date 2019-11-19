//
//  ListViewController.swift
//  VideoJournal
//
//  Created by Пенькевич Василий on 11/7/19.
//  Copyright © 2019 Пенькевич Василий. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var savedVideoList: UITableView!
    var videoFiles = [URL]()
    let fileManager = CameraFileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Saved Videos"
        fetchSavedVideoFiles()
        savedVideoList.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.hidesBarsOnTap = false
    }
    
    func fetchSavedVideoFiles() {
        guard let videoFolder = fileManager.fetchSavedMergedVideosDirectory() else { return }
        do {
            let fileArray = try FileManager.default.contentsOfDirectory(at: videoFolder, includingPropertiesForKeys: nil)
            videoFiles = fileArray
            savedVideoList.reloadData()
        } catch {
            print(error)
        }
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoFiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = videoFiles[indexPath.row].deletingPathExtension().lastPathComponent
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard videoFiles[indexPath.row].isFileURL else {
            return
        }
        guard let playerVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController else { return }
        
        playerVC.videoUrl = videoFiles[indexPath.row]
        self.navigationController?.pushViewController(playerVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete File
            let isDeleted = fileManager.deleteFile(atUrl: videoFiles[indexPath.row])
            if isDeleted {
                self.videoFiles.remove(at: indexPath.row)
                savedVideoList.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
}
