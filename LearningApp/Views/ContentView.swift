//
//  ContentView.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            LazyVStack {
                
                if model.currentModule != nil {
                    
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                        
                        NavigationLink(
                            destination: ContentDetailView()
                                .onAppear(perform: {
                                    model.beginLesson(index)
                                }),
                            label: {
                                
                                ContentViewRow(index: index)
                                
                            })
                        
                        
                    }
                    .navigationBarTitle("Learn \(model.currentModule?.category ?? "")")
                }
            }
            .accentColor(.black)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
