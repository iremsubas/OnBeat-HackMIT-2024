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
    
    @State private var counter = 0
    @State private var isUpArrowPressed = false
    @State private var timer: Timer?
    
    init()
    {
        let network = Network() // Initialize the network
        _audioPlayer = StateObject(wrappedValue: AudioPlayerViewModel(network: network))
        network.fetchAudioURLs() // Fetch the audio URLs on initialization
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
                
                // Heart Rate
                HStack(spacing: 5) {
                    Text("168")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    
                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.red)
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
                    }
                    .onDisappear {
                        // Invalidate the timer when the view disappears
                        timer?.invalidate()
                    }
                    .onReceive(NotificationCenter.default.publisher(for: NSEvent.keyDownNotification)) { notification in
                        if let event = notification.object as? NSEvent {
                            // Detect if the up arrow key is pressed
                            if event.keyCode == 126 { // keyCode for up arrow is 126
                                isUpArrowPressed = true
                            }
                        }
                    }
                    .onReceive(NotificationCenter.default.publisher(for: NSEvent.keyUpNotification)) { notification in
                        if let event = notification.object as? NSEvent {
                            // Detect if the up arrow key is released
                            if event.keyCode == 126 { // keyCode for up arrow is 126
                                isUpArrowPressed = false
                            }
                        }
                    }
                }
    func setupTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                if isUpArrowPressed {
                    counter += 1
                }
            }
        }
        }

}
