import Foundation
import FirebaseFirestore
import Combine
import FirebaseAuth

class HabitManager: ObservableObject {
    @Published var savedHabits: [HabitResponse.ResponseData] = []
    
    private let dataBase = Firestore.firestore()
    
    func getSavedHabits() {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        dataBase.collection("savedHabits")
            .whereField("userId", isEqualTo: userId) // Filter habits by userId
            .addSnapshotListener { querySnapshot, error in
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
                    
                    return HabitResponse.ResponseData(id: document.documentID, description: description, frequency: frequency)
                }
                
                DispatchQueue.main.async {
                    self.savedHabits = savedHabits
                }
            }
    }

    
    func saveHabit(description: String, frequency: String) {
        guard let userId = Auth.auth().currentUser?.uid else { return }

        let habitData: [String: Any] = [
            "description": description,
            "frequency": frequency,
            "completed": false,
            "userId": userId
        ]
        
        dataBase.collection("savedHabits").addDocument(data: habitData) { error in
            if let error = error {
                print("Error sending habit to Firestore: \(error)")
            } else {
                print("Habit successfully sent: \(description)")
                self.getSavedHabits()
            }
        }
    }

    
    func updateHabitCompletion(_ habit: HabitResponse.ResponseData) {
        let habitRef = dataBase.collection("savedHabits").document(habit.id)
        habitRef.updateData([
            "completed": true // Mark the habit as completed
        ]) { error in
            if let error = error {
                print("Error updating habit completion: \(error)")
            } else {
                print("Habit marked as completed.")
            }
        }
    }
    
    func deleteHabit(_ habit: HabitResponse.ResponseData) {
        dataBase.collection("savedHabits").document(habit.id).delete { error in
            if let error = error {
                print("Error deleting habit: \(error)")
            } else {
                print("Habit deleted successfully.")
                // Remove habit locally from the list after deleting
                DispatchQueue.main.async {
                    self.savedHabits.removeAll { $0.id == habit.id }
                }
            }
        }
    }
}
