import SwiftUI
import AVFoundation
import AVFoundation
import Combine

class AudioPlayerViewModel: ObservableObject {
    var player: AVPlayer?
    @Published var isPlaying = false
    @Published var currentTrackIndex = 0
    @EnvironmentObject var network: Network
    @Published var audioURLs: [String] = []
    private var cancellables = Set<AnyCancellable>()

    init(network: Network) {
        // Subscribe to the network service to fetch audio URLs
        network.$audioURLs
            .sink { [weak self] urls in
                self?.audioURLs = urls
                if !urls.isEmpty {
                    self?.playCurrentTrack()
                }
            }
            .store(in: &cancellables)
    }
    
    // Function to toggle play/pause
    func togglePlayPause() {
        if let player = player {
            if isPlaying {
                player.pause()
                isPlaying = false
            } else {
                player.play()
                isPlaying = true
            }
        } else {
            playCurrentTrack()
        }
    }
    
    // Play the current track
    func playCurrentTrack() {
        if let audioURL = URL(string: audioURLs[currentTrackIndex]) {
            print("playing: ")
            print(audioURLs[currentTrackIndex])
            player = AVPlayer(url: audioURL)
            player?.play()
            isPlaying = true
        }
    }
    
    // Stop playing the audio
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
        isPlaying = false
    }
    
    // Move to the next track
    func nextTrack() {
        if currentTrackIndex + 1 < audioURLs.count {
            stop() // Stop the current track
            currentTrackIndex += 1
            playCurrentTrack() // Start the next track
        }
    }
    
    // Move to the next track
    func prevTrack() {
        if currentTrackIndex - 1 >= 0 {
            stop() // Stop the current track
            currentTrackIndex -= 1
            playCurrentTrack() // Start the next track
        }
    }
}
