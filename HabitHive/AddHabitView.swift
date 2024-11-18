import SwiftUI

struct AddHabitView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habitManager: HabitManager
    @State private var description = ""
    @State private var frequency = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Habit Details")) {
                    TextField("Description", text: $description)
                    TextField("Frequency", text: $frequency)
                }
                
                Button("Save Habit") {
                    guard !description.isEmpty, !frequency.isEmpty else {
                        return // Handle empty fields if necessary
                    }
                    habitManager.saveHabit(description: description, frequency: frequency)
                    dismiss()
                }
                .disabled(description.isEmpty || frequency.isEmpty)
            }
            .navigationTitle("Add New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
