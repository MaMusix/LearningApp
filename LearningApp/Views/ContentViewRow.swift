//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
//                        Lesson card
        ZStack (alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            HStack (spacing: 20){
                Text (String(index + 1))
                    .padding(.leading, 15)
                    .font(.title)
                VStack (alignment: .leading) {
                    Text(lesson.title)
                        .font(.headline)
                        .bold()
                    Text(lesson.duration)
                        .font(.footnote)
                }
            }
            .padding()
        }
        .padding(.bottom, 5)
        .padding(.horizontal, 15)
    }
}
