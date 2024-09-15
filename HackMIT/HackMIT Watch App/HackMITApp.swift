//
//  HackMITApp.swift
//  HackMIT Watch App
//
//  Created by İremsu  Baş  on 14.09.2024.
//

import SwiftUI

@main
struct HackMIT_Watch_AppApp: App {
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(network)
            }
        }
    }
}
