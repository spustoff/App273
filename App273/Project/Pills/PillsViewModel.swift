//
//  PillsViewModel.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI
import CoreData

final class PillsViewModel: ObservableObject {
    
    @Published var pills: [PillsModel] = []
    
    @Published var name: String = ""
    @Published var price: String = ""
    @Published var for_text: String = ""
    @Published var text: String = ""
    
    func addPill() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PillsModel", into: context) as! PillsModel
        
        loan.name = name
        loan.price = Int16(price) ?? 0
        loan.for_text = for_text
        loan.text = text
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchPills() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PillsModel>(entityName: "PillsModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.pills = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.pills = []
        }
    }
}
