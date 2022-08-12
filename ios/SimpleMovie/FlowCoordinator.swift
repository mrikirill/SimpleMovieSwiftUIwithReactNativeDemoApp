//
//  FlowCoordinator.swift
//  SimpleMovie
//
//  Created by Kirill Glushchenko on 9/8/2022.
//

import SwiftUI
import UIKit
import React
import Foundation


final class FlowCoordinator: ObservableObject {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showRootView() {
        let swiftUIView = PopularMovies(viewModel: .init())
            .environmentObject(self)
        let hostingView = UIHostingController(rootView: swiftUIView)
        window.rootViewController = UINavigationController(rootViewController: hostingView)
    }
    
    func showDetailMovieReactNative(movieItem: MovieItem) {
        // local Metro url
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        
        do {
            //MovieItem to JSON to pass to JavaScript
            let jsonData = try JSONEncoder().encode(movieItem)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            let mockData = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : Any]
     
            let rootView = RCTRootView(
                  bundleURL: jsCodeLocation,
                  moduleName: "RNMovieDetail",
                  initialProperties: mockData,
                  launchOptions: nil
            )
            let vc = UIViewController()
            vc.view = rootView
            let navigationController = window.rootViewController as? UINavigationController
            navigationController?.pushViewController(vc, animated: true)
         
        } catch { print(error) }
        
    }
}
