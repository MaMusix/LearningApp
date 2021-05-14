//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import SwiftUI

@main
struct LearningApp: App {
    
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
