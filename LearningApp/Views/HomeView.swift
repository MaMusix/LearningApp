//
//  ContentView.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                Text("What would you like to do today?")
                    .padding(.leading)
                ScrollView {
                    LazyVStack {
                        ForEach (model.modules) { module in
                            VStack (spacing: 20){
                            //                    Learning card
                            HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            
                            //                    Test card
                            HomeViewRow(image: module.test.image, title: "\(module.category) test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Get started")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
