//
//  ViewController.swift
//  project1
//
//  Created by Umut Avin on 28.02.2018.
//  Copyright © 2018 secret. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resetButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var counterText: UILabel!
    var counter = 0
    var isPlaying = false
    var timer = Timer()
    
    override func viewDidLoad() {
        counterText.text = String(counter)
        super.viewDidLoad()
    }
   
    @IBAction func resetTouch(_ sender: Any) {
        timer.invalidate()
        isPlaying=false
        counter = 0;
        counterText.text = String(counter)
        playButton.isEnabled = true
        pauseButton.isEnabled = true
        
    }
    
    @IBAction func playTouch(_ sender: Any) {
        isPlaying=true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updCounter), userInfo: nil, repeats: true)
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        
    }
    
    @IBAction func pauseTouch(_ sender: Any) {
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying=false
        
    }
    
    
    @objc func updCounter(){
        counter = counter + 1
        counterText.text = String(counter)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

