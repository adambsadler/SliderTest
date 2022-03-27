//
//  TestManager.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/25/22.
//

import SwiftUI

class TestViewModel: ObservableObject {
    @Published var session_id = Int()
    @Published var step_count = Int()
    @Published var ticks = [Double]()
    @Published var isLoading = false
    
    @Published var firstTestSelection = 0.0
    @Published var firstTestIncrement = 0
    @Published var secondTestSelection = 0.0
    @Published var secondTestIncrement = 0
    @Published var thirdTestSelection = 0.0
    @Published var thirdTestIncrement = 0
    
    init() {
        startTest()
    }
    
    func startTest() {
        isLoading = true
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
                let response = try JSONDecoder().decode(TestData.self, from: data)
                DispatchQueue.main.async {
                    self.session_id = response.session_id
                    self.step_count = response.step_count
                    self.ticks = response.ticks
                    self.ticks.sort(by: >)
                    self.isLoading = false
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func nextTest(selection: Int) {
        let selectionString = String(selection)
        let sessionString = String(session_id)
        
        guard let url = URL(string: "https://iostestserver-su6iqkb5pq-uc.a.run.app/test_next") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body = ["session_id": (sessionString), "choice": (selectionString)]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(TestData.self, from: data)
                DispatchQueue.main.async {
                    self.step_count = response.step_count
                    self.ticks = response.ticks
                    self.ticks.sort(by: >)
                }
                
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

