import Foundation
import FirebaseFirestore

@Observable
class HabitManager {
    
    var savedHabits: [HabitResponse.ResponseData] = []
    
    private let dataBase = Firestore.firestore()
    
    init(isMocked: Bool = false) {
        if isMocked {
            savedHabits = HabitResponse.mockedHabits
        } else {
            getSavedHabits()

        }
    }
    
    func getSavedHabits() {
        dataBase.collectionGroup("savedHabits").addSnapshotListener { querySnapshot, error in
            
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents \(String(describing: error))")
                return
            }
            
            let savedHabits = documents.compactMap { document in
                do {
                    return try document.data(as: HabitResponse.ResponseData.self)
                } catch {
                    print("Error decoding document into habit: \(error)")
                    return nil
                }
            }
            
            self.savedHabits = savedHabits
            
        }
    }
    
    
    func saveHabit(description: String, frequency: String) {
        do {
            let habit = HabitResponse.ResponseData(description: description, frequency: frequency)
            
            try dataBase.collection("savedHabits").document().setData(from: habit)
            print("Habit successfully sent: \(description)")
        } catch {
            print("Error sending habit to Firestore: \(error)")
        }
    }
     
}
