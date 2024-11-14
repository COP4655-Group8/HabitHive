import Foundation
import FirebaseFirestore
import Combine

class HabitManager: ObservableObject {
    @Published var savedHabits: [HabitResponse.ResponseData] = []
    
    private let dataBase = Firestore.firestore()
    
    
    // Adding mock habits for testing without Firestore
    init(isMocked: Bool = true) {
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
            
            let savedHabits = documents.compactMap { document -> HabitResponse.ResponseData? in
                let data = document.data()
                
                guard
                    let description = data["description"] as? String,
                    let frequency = data["frequency"] as? String
                else {
                    print("Error decoding document into habit")
                    return nil
                }
                
                return HabitResponse.ResponseData(description: description, frequency: frequency)
            }
            
            DispatchQueue.main.async {
                self.savedHabits = savedHabits
            }
        }
    }
    
    func saveHabit(description: String, frequency: String) {
        let habitData: [String: Any] = [
            "description": description,
            "frequency": frequency
        ]
        
        dataBase.collection("savedHabits").addDocument(data: habitData) { error in
            if let error = error {
                print("Error sending habit to Firestore: \(error)")
            } else {
                print("Habit successfully sent: \(description)")
            }
        }
    }
}
