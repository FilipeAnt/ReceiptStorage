//
//  Receipt.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 24/03/2025.
//

import Foundation
import CoreData

struct Receipt: Codable {
    let imageData: Data?
    let date: Date?
    let totalAmount: Double
    let currency: String?
}
