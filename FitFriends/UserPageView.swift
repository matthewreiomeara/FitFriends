//
//  UserPageView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/1/21.
//

import SwiftUI

struct UserPageView: View {
    //this exerciselist gets added to once users pick and add an exercise from ExerciseListView
    @EnvironmentObject var exerciselist: Exercise
    //navigation to exerciselistview
    @State var addExercise = false
    //navigation to userprofileview
    @State var showUserProfileView = false
    //navigation to rolemodelview
    @State var showRoleModelView = false
    //variable holding current date/date chosen by user
    @State var selectedDate = Date()
    @State var isDateShown = false
    //formats date for UI purposes
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
                    VStack{
                        //grabs string from formatDate and assigns to text
                        let text: String =  formatDate.string(from: selectedDate)
                        //displays date
                        Text(text).font(.title)
                            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/10)
                            .background(Color("Color2"))
                            .foregroundColor(.white)
                            .padding(.bottom,-10)
                            //if date is clicked then wheel allowing user to pick date is shown
                            .onTapGesture {
                                withAnimation {
                                    self.isDateShown.toggle()
                                }
                            }
                        //image under date to hint to user that the date can be changed via pressing
                        Image(systemName: "chevron.compact.down")
                            .font(.system(size:35,weight:.light))
                            .foregroundColor(.white)
                            .padding(.top,-20)
                        //once date is clicked, date wheel is displayed
                        if(isDateShown) {
                            DatePicker("",selection: $selectedDate,in: ...Date(),displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(WheelDatePickerStyle())
                        }
                    }
                    //Two stacks that will eventually hold calories and rolemodel displays
                    VStack{
                        HStack {
                            Text("Add Calories").foregroundColor(.white)
                            Spacer()
                            Text("RoleModel").foregroundColor(.white)
                        }.frame(height: UIScreen.main.bounds.height/4)
                    }.background(Color("Color"))
                    .padding(.bottom,-10)

                    //list displaying exercise title and exercises to be added
                    List {
                        HStack {
                            Text("Exercises").font(.system(size: 25, weight: .bold))
                                .foregroundColor(.white)
                            //navigation link that sends users to ExerciseListView once the "plus" button is pressed
                            NavigationLink(destination: ExerciseListView(), isActive: $addExercise) {
                            }
                            .navigationTitle("Main")
                            .navigationBarTitleDisplayMode(.inline)
                            //.navigationBarHidden(true)
//                            .frame(width: 0, height: 0)
//                            .hidden()
//                            .disabled(true)
                            
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
                        
                        //grabs exercises and displays them with the option of deleting via sliding to the left
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
                
                //Navigation bar on top showing image of stack of people and a single person that will eventually display current rolemodel and user data
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

