//
//  DiseasesViewModel.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI
import CoreData

final class DiseasesViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var treatment_time: String = ""
    @Published var treatment: TreatmentModel? = nil
    
    @Published var treatments_list: [TreatmentModel] = [
    
        TreatmentModel(treatID: 1, title: "Acetaminophen", price: 10, param1: "Cold", param2: "Flu", param3: "Osteoarthritis"),
        TreatmentModel(treatID: 2, title: "Ibuprofen", price: 15, param1: "Migraine", param2: "Fever", param3: "Cold"),
        TreatmentModel(treatID: 3, title: "Aspirin", price: 5, param1: "Migraine", param2: "Fever", param3: "Pain Relief"),
        TreatmentModel(treatID: 4, title: "Guaifenesin", price: 20, param1: "Cough", param2: "Bronchitis", param3: "Cold"),
    ]
    
    @Published var diseases: [DiseasesModel] = []
    
    func getTreatmentByID(_ id: Int16) -> TreatmentModel {
        
        return treatments_list.first(where: {$0.treatID == id}) ?? TreatmentModel(treatID: 1, title: "Acetaminophen", price: 10, param1: "Cold", param2: "Flu", param3: "Osteoarthritis")
    }
    
    func addDisease() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "DiseasesModel", into: context) as! DiseasesModel
        
        loan.name = name
        loan.treatment_time = treatment_time
        loan.treatment_id = Int16(treatment?.treatID ?? 0)
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchDiseases() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DiseasesModel>(entityName: "DiseasesModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.diseases = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.diseases = []
        }
    }
}

struct TreatmentModel: Identifiable {
    
    var id = UUID().uuidString
    
    let treatID: Int
    let title: String
    let price: Int
    
    let param1: String
    let param2: String
    let param3: String
}
