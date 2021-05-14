//
//  ContentModel.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
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
    
}
