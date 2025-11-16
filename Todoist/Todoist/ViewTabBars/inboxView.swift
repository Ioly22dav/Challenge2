//
//  inboxView.swift
//  Todoist
//
//  Created by Iolanda D'Avino on 10/11/25.
//

import SwiftUI

struct InboxView: View {
    @State private var tasks: [Task] = [
        Task(compito: "Study 10 pages for the exam"),
        Task(compito: "Buy new pens"),
        Task(compito: "Finish the project")
    ]
    
    @State private var isShowingAddTaskModal = false
    @State private var isShowingSelectTasksView = false
    
    func deleteTask(offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List {
                    
                    ForEach($tasks) { task in
                        HStack {
                            
                            Button {
                                task.wrappedValue.isCompleted.toggle()
                            } label: {
                                
                                Image(systemName: task.wrappedValue.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundStyle(task.wrappedValue.priority?.color ?? .secondary)
                            }
                            .buttonStyle(.plain)
                            
                            Text(task.wrappedValue.compito)
                                .strikethrough(task.wrappedValue.isCompleted, color: .gray)
                                .foregroundColor(task.wrappedValue.isCompleted ? .gray : .primary)
                        }
                        .padding(.vertical, 6)
                        
                        .contextMenu {
                            Button(role: .destructive){
                                if let index = tasks.firstIndex(where: { $0.id == task.wrappedValue.id}){
                                    deleteTask(offsets: IndexSet([index]))
                                }
                            } label:{
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    } // end ForEach
                    .onDelete(perform: deleteTask)
                    
                } // end List
                .listStyle(.plain)
                
                Button {
                    isShowingAddTaskModal = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.bold))
                        .frame(width: 56, height: 56)
                        .background(Color.accent)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .padding (.trailing, 30)
                .padding (.bottom, 30)
                
                .navigationTitle("Inbox")
                
                .sheet(isPresented: $isShowingAddTaskModal){
                    AddTaskModalView(tasks: $tasks)
                        .presentationDetents([.fraction(0.75)])
                        .ignoresSafeArea(.keyboard, edges: .top)
                }
                
                
                .fullScreenCover(isPresented: $isShowingSelectTasksView) {
                    SelectTasksView(tasks: $tasks)
                }
                
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            // azione
                        } label: {
                            Image(systemName: "list.bullet.rectangle.portrait")
                        }
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button {
                                
                                isShowingSelectTasksView = true
                            } label: {
                                Label("Select Task", systemImage: "square.stack")
                            }
                            
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                }
                
            }// end NavigationStack
            
        }
    }// end body
}// end View
   

#Preview {
    InboxView()
}
