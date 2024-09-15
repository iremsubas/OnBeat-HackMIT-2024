import Foundation
import Combine

struct AudioResponse: Codable {
    let list: [String]
}

class Network: ObservableObject {
    @Published var audioURLs: [String] = []
    
    func fetchAudioURLs() {
        self.audioURLs = ["https://cdn1.suno.ai/ac6a7057-a3b9-4638-9a66-b0ba6325ea91.mp3","https://cdn1.suno.ai/274a4422-41c5-4678-b857-b04b5f1060c8.mp3","https://cdn1.suno.ai/4f880a93-8bbf-4e08-b9f5-2afa1443aeb9.mp3"]
    }
    
//    func fetchAudioURLs() {
//        // Replace with your actual server URL
//        guard let url = URL(string: "https://example.com/api/audio-urls") else {
//            print("Invalid URL")
//            return
//        }
//        
//        // Create the URLSession request
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print("Error fetching audio URLs: \(error)")
//                return
//            }
//            
//            guard let data = data else {
//                print("No data returned")
//                return
//            }
//            
//            // Parse the data (now based on your JSON format)
//            do {
//                let fetchedResponse = try JSONDecoder().decode(AudioResponse.self, from: data)
//                
//                // Update the audioURLs property on the main thread
//                DispatchQueue.main.async {
//                    self.audioURLs = fetchedResponse.list
//                }
//            } catch {
//                print("Error decoding JSON: \(error)")
//            }
//        }
//        
//        // Start the network request
//        task.resume()
//    }
}


//// Network.swift
//
//import SwiftUI
//
//class Network: ObservableObject {
//    @Published var cdns: [String] = []
//    
//    func getCDNs() {
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { fatalError("Missing URL") }
//        
//        let urlRequest = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if let error = error {
//                print("Request error: ", error)
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse else { return }
//            
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//                DispatchQueue.main.async {
//                    do {
//                        let decodedCDNs = try JSONDecoder().decode([Request].self, from: data)
//                        for c in decodedCDNs {
//                            self.cdnRequests.append(c.cdn)
//                        }
//                    } catch let error {
//                        print("Error decoding: ", error)
//                    }
//                }
//            }
//        }
//        
//        dataTask.resume()
//    }
//    
//}
