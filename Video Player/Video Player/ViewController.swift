//
//  ViewController.swift
//  Video Player
//
//  Created by LH on 2021/6/25.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let videoBtn = UIButton()
        videoBtn .setTitle("play video", for: .normal)
        videoBtn.setTitleColor(.blue, for: .normal)
        videoBtn.addTarget(self, action: #selector(palyVideo), for: .touchUpInside)
        videoBtn.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        self.view .addSubview(videoBtn)
        
        
        let audioPlayBtn = UIButton()
        audioPlayBtn .setTitle("play audio", for: .normal)
        audioPlayBtn.setTitleColor(.red, for: .normal)
        audioPlayBtn.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        audioPlayBtn.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        self.view .addSubview(audioPlayBtn)
        
        let audioPauseBtn = UIButton()
        audioPauseBtn .setTitle("pause audio", for: .normal)
        audioPauseBtn.setTitleColor(.red, for: .normal)
        audioPauseBtn.addTarget(self, action: #selector(pauseAudio), for: .touchUpInside)
        audioPlayBtn.frame = CGRect(x: 50, y: 250, width: 100, height: 50)
        self.view .addSubview(audioPauseBtn)
        
    }

    func initAudio() {
        let audioPath = Bundle.main.path(forResource: "live", ofType: "mp3")
        let audioUrl = URL(fileURLWithPath: audioPath!)
        do {
            
           audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
            
        } catch  {
            audioPlayer = nil
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playAndRecord)
            try AVAudioSession.sharedInstance().setActive(true, options: AVAudioSession.SetActiveOptions.notifyOthersOnDeactivation)
        } catch {
            print("error")
        }
        
    }
    @objc func palyVideo() {
        let videoUrl  = URL(string: "")
        let player = AVPlayer(url: videoUrl!)
        let playerViewController  = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {}
        
    }
    @objc func playAudio() {
        audioPlayer?.play()
    }
    
    @objc func pauseAudio() {
        audioPlayer?.pause()
    }
}

