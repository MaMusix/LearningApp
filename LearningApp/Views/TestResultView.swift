//
//  ResulsView.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 15.05.21.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model: ContentModel
    var numCorrect: Int
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            return ""
        }
        
        let percentage = Double(numCorrect) / Double(model.currentModule!.test.questions.count)
        if percentage < 0.4 { return "Das solltest du dir wohl noch mal anschauen" }
        else if percentage > 0.4 {return "Naja, das wäre gerade mal eine 4"}
        else if percentage > 0.6 { return "Das wäre immerhin eine 3" }
        else if percentage > 0.75 { return "Gut gemacht!"}
        else if percentage > 0.93 { return "Super! So muss das sein" }
        
    }
    var body: some View {
        
        VStack {
            Spacer()
            
            Text(resultHeading)
                .font(.title)
            
            Spacer()
            
            Text("You've got \(numCorrect) out of \(model.currentModule!.test.questions.count ) answers correct.")
            
            Spacer()
            
            Button {
                model.currentTestSelected = nil
            }
            label: {
                ZStack {
                    RectangleCard(color: Color.green)
                        .frame(height: 48)
                    
                }
            }
            .padding()
            
            Spacer()
        }
        
    }
}


struct TestResultView_PreViews: PreviewProvider {
    static var previews: some View {
        TestResultView()
    }
}
