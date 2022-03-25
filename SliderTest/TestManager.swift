//
//  TestManager.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/25/22.
//

import SwiftUI
import Combine

class TestManager {
    
    func startTest() {
        guard let url = URL(string: "https://iostestserver-su6iqkb5pq-uc.a.run.app/test_start") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["choice": "start"]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(FirstTestResults.self, from: data)
                print(response)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
}
