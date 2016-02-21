//
//  VEDPlayVideoViewController.swift
//  VietED
//
//  Created by Phung Long on 12/28/15.
//  Copyright © 2015 Phung Long. All rights reserved.
//

import UIKit
import YouTubePlayer

class VEDPlayVideoViewController: VEDBaseViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet var videoPlayer: YouTubePlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadYoutubeVideo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func shouldAutorotate() -> Bool {
//        return false
//    }
//    
//
//    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        return UIInterfaceOrientationMask.AllButUpsideDown
//    }
    
    func loadYoutubeVideo(){
        videoPlayer.playerVars = [
            "playsinline": "1",
            "controls": "0",
            "showinfo": "0"
        ]
        // seek video
        //        videoPlayer.seekTo(120, seekAhead: true)
        // Load play list video
        //        videoPlayer.loadPlaylistID("")
        // Load video from YouTube ID
        //        videoPlayer.loadVideoID("nfWlot6h_JM")
        // Load video from YouTube URL

        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=wQg3bXrVLtg")
        videoPlayer.loadVideoURL(myVideoURL!)

    }

    @IBAction func prevButtonClicked(sender: AnyObject) {
        videoPlayer.previousVideo()
    }
    @IBAction func playButtonClicked(sender: AnyObject) {
        if videoPlayer.ready {
            if videoPlayer.playerState != YouTubePlayerState.Playing {
                videoPlayer.play()
                playButton.setTitle("Pause", forState: .Normal)
            } else {
                videoPlayer.pause()
                playButton.setTitle("Play", forState: .Normal)
            }
        }

    }
    @IBAction func nextButtonClicked(sender: AnyObject) {
        videoPlayer.nextVideo()

    }
}
