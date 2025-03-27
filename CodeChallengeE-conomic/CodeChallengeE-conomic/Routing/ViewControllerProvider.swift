//
//  ViewControllerProvider.swift
//  CodeChallengeE-conomic
//
//  Created by Filipe Almeida António on 27/03/2025.
//

import Foundation
import UIKit

protocol RoutingDestinationProtocol {}

protocol RouterProtocol {
    associatedtype RoutingDestination: RoutingDestinationProtocol
    func route(to destination: RoutingDestination, navigation: UINavigationController)
}

enum RoutingDestination: RoutingDestinationProtocol {
    case addNewReceipt
    case viewAllReceipts
    // etc.
}

class Router: RouterProtocol {
    
    static let shared = Router()
    func route(to destination: RoutingDestination, navigation: UINavigationController) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        switch destination {
        case .addNewReceipt:
            let vc = storyBoard.instantiateViewController(identifier: "LoadReceiptViewController")
            navigation.pushViewController(vc, animated: true)
        case .viewAllReceipts:
            let vc = storyBoard.instantiateViewController(identifier: "LoadReceiptViewController")
            navigation.pushViewController(vc, animated: true)
        }
    }
}
