//
//  FirstTestResults.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/25/22.
//

import Foundation

struct FirstTestResults: Codable {
    let session_id: Int
    let step_count: Int
    let ticks: [Double]
}
