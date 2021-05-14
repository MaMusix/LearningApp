//
//  ContentModel.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    //    Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    //    CUrrent lesson
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
    @Published var currentQuestion: Question?
    var currentQuestionIndex = 0
    
    
    @Published var codeText = NSAttributedString()
    var styleData: Data?
    
    @Published var currentContentSelected: Int?
    
    @Published var currentTestSelected: Int?
    
    
    init() {
        
        getLocalData()
        
    }
    
    //    Mark Data methods
    
    func getLocalData() {
        
        //        data.json importieren
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            do {
                
                let modules = try JSONDecoder().decode([Module].self, from: jsonData)
                
                self.modules = modules
                
            } catch {
                
                print("Error: Fehler beim Dekodieren der Daten")
                
            }
            
        } catch {
            print("Error: Fehler beim Einlesen der Daten")
        }
        
        
        
        //        style.html importieren
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
            
        } catch {
            
            print("Error: Fehler beim Einlesen des Styles")
            
        }
        
        
        
        
    }
    
    //    Mark Module navigation methods
    
    func beginModule(_ moduleId: Int) {
        for index in 0..<modules.count {
            if modules[index].id == moduleId {
                currentModuleIndex = index
                break
            }
        }
        
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex: Int) {
        //        Check that the lesson index is within range of module lessons
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        } else {
            currentLessonIndex = 0
        }
        //        Set the current lesson
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        codeText = addStyling(currentLesson!.explanation)
    
    }
    
    func nextLesson() {
        
        currentLessonIndex += 1
        
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
            codeText = addStyling(currentLesson!.explanation)
        } else {
            
            currentLessonIndex = 0
            currentLesson = nil
        }
    }
    
    func hasNextLesson() -> Bool {
        return currentLessonIndex + 1 < currentModule!.content.lessons.count 
    }
    
    func beginTest(_ moduleId:Int) {
        beginModule(moduleId)
        currentQuestionIndex = 0
        if currentModule?.test.questions.count ?? 0 > 0 {
            currentQuestion = currentModule!.test.questions[currentQuestionIndex]
//            Set questioncontent
            codeText = addStyling(currentQuestion!.content)
        }
    
    }
    
    //    Code Styling
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        if styleData != nil {
            data.append(styleData!)
        }
        
        data.append(Data(htmlString.utf8))
        
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultString = attributedString
            
            
        }
        return resultString
        
    }
}
