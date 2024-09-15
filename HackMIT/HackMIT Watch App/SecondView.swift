//
//  SecondView.swift
//  HackMIT Watch App
//
//  Created by İremsu  Baş  on 15.09.2024.
//

import Foundation
import SwiftUI

struct SecondView: View {
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
                        // Previous action
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
                        // Play action
                    })
                    {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                            .foregroundColor(.white)
                    }.buttonStyle(PlainButtonStyle())

                    
                    // Next button
                    Button(action: {
                        // Next action
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
        }
}
