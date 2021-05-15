//
//  TestView.swift
//  LearningApp
//
//  Created by Christopher Ching on 2021-03-24.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex: Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading){
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                
                // Answers
                ScrollView {
                    VStack {
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                //                                    Track the selected Index
                                selectedAnswerIndex = index
                            } label: {
                                ZStack {
                                    if submitted == false {
                                        
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                        
                                    } else {
                                        //                                        answer has been submitted
                                        if index == model.currentQuestion?.correctIndex {
                                            RectangleCard(color: Color.green)
                                                .frame(height: 48)
                                            
                                        }
                                        if index == selectedAnswerIndex &&
                                                index != model.currentQuestion?.correctIndex {
                                            RectangleCard(color: Color.red)
                                                .frame(height: 48)
                                        } else {
                                            RectangleCard(color: Color.white)
                                                .frame(height: 48)
                                    }
                                    Text(model.currentQuestion!.answers[index])
                                }
                            }
                            
                        }
                        .disabled(submitted)
                    }
                }
                .frame(height: 48)
                .accentColor(.black)
                .padding()
                
                // Submit Button
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
            Button {
                submitted = true
                
                if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                    numCorrect += 1
                }
            } label: {
                ZStack {
                    RectangleCard()
                    Text("Submit")
                        .foregroundColor(Color.white)
                        .bold()
                }
                .padding()
                
            }
            .disabled(selectedAnswerIndex == nil)
        }
        
    }
}
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
        
    }
}
