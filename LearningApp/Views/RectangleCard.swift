//
//  RectangleCard.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import SwiftUI

struct RectangleCard: View {
    
    var color = Color.white
    
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
        
    }
}
