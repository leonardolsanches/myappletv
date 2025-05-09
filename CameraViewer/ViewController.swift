import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var videoView: UIView!
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?

    // Substitua pela URL real da sua câmera IP (MJPEG ou HLS)
    private let cameraURL = URL(string: "http://your-camera-ip/stream.mjpeg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoView()
    }
    
    private func setupVideoView() {
        player = AVPlayer(url: cameraURL)
        playerLayer = AVPlayerLayer(player: player)
        if let playerLayer = playerLayer {
            playerLayer.frame = videoView.bounds
            playerLayer.videoGravity = .resizeAspect
            videoView.layer.addSublayer(playerLayer)
        }
    }
    
    @IBAction func loadCameraButtonTapped(_ sender: UIButton) {
        player?.play()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer?.frame = videoView.bounds
    }
}