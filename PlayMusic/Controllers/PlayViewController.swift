//
//  PlayViewController.swift
//  PlayMusic
//
//  Created by Lâm Nguyễn on 07/07/2021.
//  Copyright © 2021 Lâm Nguyễn. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {
    
    @IBOutlet weak var lbnameSong: UILabel!
    @IBOutlet weak var lbnameSinger: UILabel!
    @IBOutlet weak var imageSinger: UIImageView!
    @IBOutlet weak var imageSingerSmall: UIImageView!
    @IBOutlet weak var play_options: UIButton!
    @IBOutlet weak var pause_options: UIButton!
    @IBOutlet weak var slider_Volume: UISlider!
    @IBOutlet weak var volume: UIButton!
    @IBOutlet weak var mute: UIButton!
    @IBOutlet weak var slider_time: UISlider!

    var namesong: String!
    var namesinger: String!
    var imgSinger: String!
    var imgSingerSmall: String!
    var song: String!
    var player:AVAudioPlayer!
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        play_music()
        player.play()
        play_options.isHidden = true
        pause_options.isHidden = false
        slider_Volume.maximumValue = 1
        slider_Volume.minimumValue = 0
        slider_Volume.value = 0.5
        mute.isHidden = true
        volume.isHidden = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        self.slider_time.maximumValue = Float(self.player.duration)
        self.slider_time.minimumValue = 0
        imageSingerSmall.layer.cornerRadius = (imageSingerSmall.frame.width) / 2
        var i:CGFloat = 1
        timer = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true, block: { (time) in
        if(i>1800){
            i = 1
        }
            self.imageSingerSmall.transform = CGAffineTransform(rotationAngle: i*CGFloat(M_PI)/100)
            i += 1
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player.pause()
    }
    
    func setupData() {
        self.lbnameSong.text = namesong
        self.lbnameSinger.text = namesinger
        self.imageSinger.image = UIImage(named: imgSinger ?? "")
        self.imageSingerSmall.image = UIImage(named: imgSingerSmall ?? "")
    }
    
    func play_music(){
        guard let path = Bundle.main.path(forResource: song, ofType: nil) else {
            return
        }
        guard let url = URL(string: path) else {
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("Error")
        }
    }
    
    @IBAction func play_Clicked(_ sender: Any) {
        player.play()
        play_options.isHidden = true
        pause_options.isHidden = false
    }
    
    @IBAction func pause_Clicked(_ sender: Any) {
        player.pause()
        pause_options.isHidden = true
        play_options.isHidden = false
    }
    
    @IBAction func update_Clicked(_ sender: Any) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        self.player.currentTime = 0
        pause_options.isHidden = false
        play_options.isHidden = true
        player.play()
    }
    
    @IBAction func stop_Clicked(_ sender: Any) {
        player.pause()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        self.player.currentTime = 0
        pause_options.isHidden = true
        play_options.isHidden = false
    }

    @IBAction func volume_action(_ sender: Any) {
        player.volume = slider_Volume.value
        if(slider_Volume.value == 0){
            volume.isHidden = true
            mute.isHidden = false
        } else {
            volume.isHidden = false
            mute.isHidden = true
        }
    }
    
    @IBAction func volume_Clicked(_ sender: Any) {
        volume.isHidden = true
        mute.isHidden = false
        player.volume = 0
    }
    
    @IBAction func mute_Clicked(_ sender: Any) {
        mute.isHidden = true
        volume.isHidden = false
        player.volume = slider_Volume.value
    }
    
    @IBAction func time_action(_ sender: Any) {
        player.currentTime = TimeInterval(slider_time.value)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.slider_time.value = Float(self.player.currentTime)
        })
        if self.player.currentTime == 0 {
            pause_options.isHidden = true
            play_options.isHidden = false
        } else if(player.play()) {
            pause_options.isHidden = false
            play_options.isHidden = true
        }
    }
    
}
