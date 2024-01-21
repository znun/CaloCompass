//
//  ContentView.swift
//  CaloCompass
//
//  Created by Mahmudul Hasan on 21/1/24.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalCaloriesToday())) Kcal (today)")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                List {
                    ForEach(food) { food in
                        NavigationLink(destination: Text("\(food.calories)")) {
                            HStack{
                            VStack(alignment: .leading, spacing: 6) {
                                Text(food.name!)
                                    .bold()
                                Text("\(Int(food.calories))") + Text(" calories").foregroundColor(.red)
                                
                            }
                            Spacer()
                            Text(calcTimeSince(date: food.date!))
                                    .foregroundColor(.gray)
                                    .italic()
                        }
                    }
                }
                    .onDelete(perform: deleteFood)
                    
                }
                .listStyle(.plain)
            }
            .navigationTitle("CaloCompass")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showingAddView.toggle()
                    } label: {
                      Label("Add Food", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView){
                AddFoodView()
            } .navigationViewStyle(.stack)
        }
    }
    
    private func deleteFood(offSets: IndexSet) {
        withAnimation{
            offSets.map { food[$0] }.forEach(managedObjContext.delete)
            DataController().save(context: managedObjContext)
            
        }
        
    }
    
    private func totalCaloriesToday() -> Double {
        return 0.00
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
