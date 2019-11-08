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
    
    //MARK: Top Bar Panel Labels
    @IBOutlet weak var rotateLabel: UILabel!
    
    @IBOutlet weak var proModeLabel: UILabel!
    
    @IBOutlet weak var photoCameraLabel: UILabel!
    
    @IBOutlet weak var microphoneLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    //MARK: Variables

    
    
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
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
