//
//  SecondView.swift
//  HackMIT Watch App
//
//  Created by İremsu  Baş  on 15.09.2024.
//

import Foundation
import SwiftUI

struct SecondView: View {
    @StateObject private var network = Network()
    @StateObject private var audioPlayer : AudioPlayerViewModel
    
    @State private var counter = 0.0
    @State private var increment = 1.0
    @State private var isUpArrowPressed = false
    @State private var timer: Timer?
    @State private var time = 0.0
    @State private var totaltime = 0.0
    
    init()
    {
        let network = Network() // Initialize the network
        _audioPlayer = StateObject(wrappedValue: AudioPlayerViewModel(network: network))
        network.fetchAudioURLs() // Fetch the audio URLs on initialization
//        audioPlayer.player!.rate = 2.0
    }
    
    var body: some View {
        VStack(spacing: 0) {
                // Top icon (running with music)
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                
                // Timer (01:11:02)
            Text("01:11:02")
                    .font(.system(size: 35, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                
                // Steps
                HStack(spacing: 5) {
                    Image(systemName: "figure.step.training")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                    Text("\(Int(counter)) steps/min")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                
                Spacer()

                // Media controls (back, play, next)
                HStack(spacing: 30) {
                    // Previous button
                    Button(action: {
                        audioPlayer.prevTrack()
                    }) {
                        Image(systemName: "backward.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .background(Color.black)
                            .foregroundColor(.white)
                    }.buttonStyle(PlainButtonStyle())
                    
                    // Play button
                    Button(action: {
                        audioPlayer.togglePlayPause()
                    })
                    {
                        Image(systemName: audioPlayer.isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                            .foregroundColor(.white)
                    }.buttonStyle(PlainButtonStyle())

                    
                    // Next button
                    Button(action: {
                        audioPlayer.nextTrack()
                    }) {
                        Image(systemName: "forward.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .background(Color.black)
                            .foregroundColor(.white)
                    }.buttonStyle(PlainButtonStyle())
                }
                //.padding(.bottom, 10) // Add padding to move the buttons higher
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black) // Background color
            .edgesIgnoringSafeArea(.all) // Extend to the full screen
        
            .onAppear {
                        // Set up the timer to increase the counter when the up arrow is pressed
                        setupTimer()
//                        audioPlayer.togglePlayPause()
//                audioPlayer.player!.rate = 2.0
                    }
                    .onDisappear {
                        // Invalidate the timer when the view disappears
                        timer?.invalidate()
                    }
                }
        func setupTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                time += 0.1
                totaltime += 0.1
                counter += increment / (time * 2)
                if (time > 8) {
                    if audioPlayer.currentTrackIndex != audioPlayer.audioURLs.count - 1 {
                        audioPlayer.nextTrack()
                        increment = increment + 1
                        time = 0.0
                    }
                }
            }
        }
    func formattedTime(seconds: Double) -> String {
            let hours = Int(seconds) / 3600
            let minutes = (Int(seconds) % 3600) / 60
            let remainingSeconds = Int(seconds) % 60
            return String(format: "%02d:%02d:%02d", hours, minutes, remainingSeconds)
        }

}
