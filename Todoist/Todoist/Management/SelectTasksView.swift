//
//  SelectTasksView.swift
//  Todoist
//
//  Created by Iolanda D'Avino on 16/11/25.
//

import SwiftUI

struct SelectTasksView: View {
    
    @Binding var tasks: [Task]
    @State private var selectedTaskIDs: Set<UUID> = []
    @Environment(\.dismiss) var dismiss
    
    private var allTasksSelected: Bool {
        return tasks.count > 0 && selectedTaskIDs.count == tasks.count
    }

    private var atLeastOneSelectedTaskHasPriority: Bool {
        let selectedTasks = tasks.filter { selectedTaskIDs.contains($0.id) }
        return selectedTasks.contains { $0.priority != nil }
    }
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(tasks) { task in
                    HStack {
                        Button {
                            toggleSelection(for: task.id)
                        } label: {
                            Image(systemName: selectedTaskIDs.contains(task.id) ? "checkmark.circle.fill" : "circle")
                                .font(.title2)
                        }
                        .buttonStyle(.plain)
                        .foregroundStyle(task.priority?.color ?? .secondary)
                        
                        Text(task.compito)
                        
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        toggleSelection(for: task.id)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Select Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.subheadline.bold())
                    }
                    .tint(.primary)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(allTasksSelected ? "Deselect All" : "Select All") {
                        toggleSelectAll()
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(role: .destructive) {
                            deleteSelectedTasks()
                        } label: {
                            Image(systemName: "trash")
                        }
                        .disabled(selectedTaskIDs.isEmpty)
                        .tint(.red)
                        
                        Spacer()
                        
                        Menu {
                            ForEach(TaskPriority.allCases) { priority in
                                Button {
                                    setPriorityForSelectedTasks(priority)
                                } label: {
                                    HStack {
                                        Image(systemName: "flag.fill")
                                            .renderingMode(.template)
                                            .foregroundColor(priority.color)

                                        Text(priority.name)
                                            .foregroundColor(priority.color)
                                    }
                                }
                                .buttonStyle(.plain)
                            }

                            if atLeastOneSelectedTaskHasPriority {
                                Button(role: .destructive) {
                                    setPriorityForSelectedTasks(nil)
                                } label: {
                                    Label("Remove Priority", systemImage: "xmark.circle")
                                }
                                .tint(.red)
                            }
                            
                        } label: {
                            Image(systemName: "flag.fill")
                        }
                        .disabled(selectedTaskIDs.isEmpty)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    
    func toggleSelection(for id: UUID) {
        if selectedTaskIDs.contains(id) {
            selectedTaskIDs.remove(id)
        } else {
            selectedTaskIDs.insert(id)
        }
    }
    
    func toggleSelectAll() {
        if allTasksSelected {
            selectedTaskIDs.removeAll()
        } else {
            selectedTaskIDs = Set(tasks.map { $0.id })
        }
    }
    
    func deleteSelectedTasks() {
        tasks.removeAll { task in
            selectedTaskIDs.contains(task.id)
        }
        selectedTaskIDs.removeAll()
    }
    
    func setPriorityForSelectedTasks(_ priority: TaskPriority?) {
        for id in selectedTaskIDs {
            if let index = tasks.firstIndex(where: { $0.id == id }) {
                tasks[index].priority = priority
            }
        }
        selectedTaskIDs.removeAll()
    }
}

#Preview {
    SelectTasksView(tasks: .constant([
        Task(compito: "Task 1", priority: .high),
        Task(compito: "Task 2"),
        Task(compito: "Task 3", priority: .low)
    ]))
}
