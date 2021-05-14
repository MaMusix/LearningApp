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
                                
                                NavigationLink(
                                    destination: ContentView()
                                        .onAppear(perform: {
                                            model.beginModule(module.id)
                                        }),
                                    tag: module.id,
                                    selection: $model.currentContentSelected,
                                    label: {
                                        
                                        //                    Learning card
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    })
                                
                                NavigationLink(
                                    destination: TestView()
                                        .onAppear(perform: {
                                        model.beginTest(module.id)
                                    }),
                                    tag: module.id,
                                    selection: $model.currentTestSelected,
                                    label: {
                                        //                    Test card
                                        HomeViewRow(image: module.test.image, title: "\(module.category) test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                                        
                                    })
                              
                            }
                        }
                    }
                    .accentColor(.black)
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
