//
//  UserPageView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/1/21.
//

import SwiftUI

struct UserPageView: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var addExercise = false
    @State var showUserProfileView = false
    @State var showRoleModelView = false
    @State var selectedDate = Date()
    @State var isDateShown = false
    var formatDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
    let backgroundCol = UIColor(red: 0/255, green: 96/255,blue: 6/255, alpha: 1.0)
    init() {
        UITableView.appearance().backgroundColor = backgroundCol
        
    }
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    //Spacer()
                    VStack{
                        let text: String =  formatDate.string(from: selectedDate)
                        Text(text).font(.title)
                            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/10)
                            .background(Color("Color2"))
                            .foregroundColor(.white)
                            .padding(.bottom,-10)
                            .onTapGesture {
                                withAnimation {
                                    self.isDateShown.toggle()
                                }
                            }
                        Image(systemName: "chevron.compact.down")
                            .font(.system(size:35,weight:.light))
                            .foregroundColor(.white)
                            .padding(.top,-20)
                        
                        if(isDateShown) {
                            DatePicker("",selection: $selectedDate,in: ...Date(),displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(WheelDatePickerStyle())
                        }
                    }//.padding(.bottom,1)
                    VStack{
                        HStack {
                            Text("Add Calories").foregroundColor(.white)
                            Spacer()
                            Text("RoleModel").foregroundColor(.white)
                        }.frame(height: UIScreen.main.bounds.height/4)
                    }.background(Color("Color"))
                    .padding(.bottom,-10)

                    List {
                        HStack {
                            Text("Exercises").font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                            NavigationLink(destination: ExerciseListView(), isActive: $addExercise) {
                            }
                            .navigationTitle("Main")
                            .navigationBarTitleDisplayMode(.inline)
                            //.navigationBarHidden(true)
                            .frame(width: 0, height: 0)
                            .hidden()
                            .disabled(true)
                            
                            Spacer()

                            Button(action: {
                                withAnimation {
                                    self.addExercise.toggle()
                                }
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.white)
                                }.buttonStyle(BorderlessButtonStyle())
                        }.listRowBackground(Color("Color2"))
                        
                        ForEach(exerciselist.items) { item in
                            HStack{
                                Text(item.name).foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.left.2")
                                    .foregroundColor(.white)
                            }.listRowBackground(Color("Color2"))
                        }
                        .onDelete(perform: deleteExercise)
                    }
                }
                //.navigationBarTitle("")
                //.navigationBarHidden(true)
                .navigationBarTitle("Main", displayMode: .inline)
                    .navigationBarItems(trailing:
                        HStack(spacing: 15) {
                            
                            NavigationLink(destination: RoleModelView(), isActive: $showRoleModelView) {
                            }
                            Button(action: {
                                withAnimation {
                                    self.showRoleModelView.toggle()
                                }
                            }){
                            Image(systemName: "person.2.square.stack.fill")
                                .font(.title)
                                .foregroundColor(Color("Color"))
                            }.buttonStyle(BorderlessButtonStyle())
                            
                            
                            NavigationLink(destination: UserProfileView(), isActive: $showUserProfileView) {
                            }
                            Button(action: {
                                withAnimation {
                                    self.showUserProfileView.toggle()
                                }
                            }) {
                            Image(systemName: "person.crop.circle.fill").font(.title)
                                .foregroundColor(Color("Color"))
                            }.buttonStyle(BorderlessButtonStyle())
                        }
                    )
            }.accentColor(.black)
        }.navigationBarTitle("")
        .navigationBarHidden(true)
    }
    func deleteExercise(at offsets: IndexSet){
        exerciselist.items.remove(atOffsets: offsets)
    }
}

struct exerciseItem: Equatable, Identifiable {
    var id: Int
    var name: String
}
class Exercise: ObservableObject {
    @Published var items = [exerciseItem]()


    func add(exercise: exerciseItem) {
        items.append(exercise)
    }

    func remove(exercise: exerciseItem) {
        if let index = items.firstIndex(of: exercise) {
            items.remove(at: index)
        }
    }
}

struct UserPageView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageView()
            .environmentObject(Exercise())
    }
}

