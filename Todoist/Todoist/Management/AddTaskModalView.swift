//
//  AddTaskModalView.swift
//  Todoist
//
//  Created by Iolanda D'Avino on 12/11/25.
//

import SwiftUI

struct AddTaskModalView: View {
    @Binding var tasks: [Task]
    @State private var newTaskName: String = ""
    @State private var showingAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField ("Text field", text: $newTaskName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Spacer ()
            }
            .navigationTitle ("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        if !newTaskName.isEmpty {
                            showingAlert = true
                        } else {
                            dismiss()
                        }
                    } label: {
                        Image (systemName: "xmark")
                    }
                    .tint(.red)
                }
                
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        tasks.append(Task(compito: newTaskName))
                        
                        dismiss()
                    } label : {
                        Image(systemName: "checkmark")
                    }
                    .disabled(newTaskName.isEmpty)
                    .tint(.accent)
                }
            }
            
            .alert("Are you sure you want to delete this task?", isPresented: $showingAlert) {
                Button ("Exit without saving", role: .destructive){
                    dismiss()
                }
                Button ("Cancel", role: .cancel) {}
                } message : {
                Text("You will lose this task.")
                }
        }
    }
}
        

#Preview {
    AddTaskModalView(tasks: .constant([]))
}

