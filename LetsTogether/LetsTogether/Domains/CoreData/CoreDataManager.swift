//
//  CoreDataManager.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 16/09/21.
//

import Foundation
import CoreData

class CoreDataManager {

    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func getItemById(id: NSManagedObjectID) -> Data? {
        do {
            return try viewContext.existingObject(with: id) as? Data
        } catch {
            return nil
        }
    }

    func saveData(currentScores: Int16, attempts: Int16) {
        let data = Data(context: viewContext)
        data.attempts = attempts
        data.currentScores = currentScores
        save()
    }

    func getData() -> Data? {
        let fetchRequest: NSFetchRequest<Data> = Data.fetchRequest()
        do {
            return try viewContext.fetch(fetchRequest).first as Data?
        } catch {
            return nil
        }
    }

    func deleteItem(data: Data) {
        viewContext.delete(data)
        save()
    }

    func updateItem(dataId: NSManagedObjectID, currentScores: Int16, attempts: Int16) {
        let data = getItemById(id: dataId)
        if let data = data {
            data.currentScores = currentScores
            data.attempts = attempts
            save()
        }
    }

    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }

    init() {
        persistentContainer = NSPersistentContainer(name: "LetsTogether")
        persistentContainer.loadPersistentStores { (_ , error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
    }
}
