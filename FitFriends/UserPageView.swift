//
//  UserPageView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/1/21.
//

import SwiftUI
import Combine


var text1 = curDate.string(from: Date())
//Formats Date for URL Request
var curDate: DateFormatter  {
    //Formats the current date
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}

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
    @State var caloriesHit: Int = 0
    @State var caloriesHitString: String = ""
    @State var calorieGoalString: String = ""
    @State var calorieGoal: Int = 0
    @State var caloriesHitFloat: CGFloat = 0
    @State var calorieGoalFloat: CGFloat = 0
    @State var percentageToInt: Int = 0
    @State var finalPercentage: CGFloat = 0
    @State var addedCals : Int = 0
    @State var roleModel: String = ""
    
    var formatDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
    //Formats Date for URL Request
    var stringDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    let backgroundCol = UIColor(red: 114/255, green: 159/255,blue: 106/255, alpha: 1.0)
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
                            //.padding(.bottom,-10)
                            //if date is clicked then wheel allowing user to pick date is shown
                            .onTapGesture {
                                withAnimation {
                                    self.isDateShown.toggle()
                                    text1 = stringDate.string(from: selectedDate)
                                    print("DATE: " + text1)
                                }
                            }
                        //image under date to hint to user that the date can be changed via pressing
                        Image(systemName: "chevron.compact.down")
                            .font(.system(size:35,weight:.light))
                            .foregroundColor(.white)
                            .padding(.top,-30)
                        //once date is clicked, date wheel is displayed
                        if(isDateShown) {
                            DatePicker("",selection: $selectedDate,in: ...Date(),displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(WheelDatePickerStyle())
                        }
                    }
                    //Two stacks that will eventually hold calories and rolemodel displays
                    VStack {
                        HStack{
                            VStack {
                                ZStack {
                                    Track()
                                    Label(caloriesHit: caloriesHit, calorieGoal: calorieGoal)
                                    Outline(percentage: finalPercentage)
                                }.padding(.top,15)
                            }
                            .padding(.leading, UIScreen.main.bounds.width/12)
                            VStack {
                                Image("beginner")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:UIScreen.main.bounds.width/3,height:UIScreen.main.bounds.width/3)
                                    .clipShape(Circle())
                            }.frame(minWidth: 0, maxWidth: .infinity)
                            .padding(.leading,UIScreen.main.bounds.width/10)
                            .padding(.top,15)
                        }.padding(.bottom, 10)
                        HStack{
                            VStack{
                                HStack {
                                    Text("Calorie Goal:")
                                        .bold()
                                        .font(.system(size:15))
                                        .frame(width:UIScreen.main.bounds.width/4,height:25)
                                        .foregroundColor(.white)

                                    TextField("0000", text: self.$calorieGoalString)
                                        .foregroundColor(.white)
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(calorieGoalString)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.calorieGoalString = filtered
                                            }
                                        }
                                        .frame(width: UIScreen.main.bounds.width/10)
                                        .padding(.leading,-10)
                                    Button(action: {
                                        self.calorieGoal = Int(calorieGoalString) ?? 0
                                        self.calorieGoalString = ""
                                        self.caloriesHit = 0
                                        self.finalPercentage = 0
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.white)
                                    }
                                }
                                HStack {
                                    Text("Add Calories:")
                                        .bold()
                                        .font(.system(size: 15))
                                        .frame(width:UIScreen.main.bounds.width/4,height:25)
                                        .foregroundColor(.white)

                                    TextField("0000", text: self.$caloriesHitString)
                                        .foregroundColor(.white)
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(caloriesHitString)) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.caloriesHitString = filtered
                                            }
                                        }
                                        .frame(width: UIScreen.main.bounds.width/10)
                                        .padding(.leading,-10)
                                    Button(action: {
                                        //grab string int and turn into int or 0
                                        self.addedCals = Int(caloriesHitString) ?? 0
                                        //turn both inputs into float
                                        self.caloriesHitFloat = CGFloat(addedCals)
                                        self.calorieGoalFloat = CGFloat(calorieGoal)
                                        //get percentage
                                        self.finalPercentage = (caloriesHitFloat/calorieGoalFloat) + finalPercentage/100
                                        //turn percentage into correct float
                                        self.finalPercentage = finalPercentage * 100
                                        //grab calories inputted
                                        //self.caloriesHit
                                        self.caloriesHit = addedCals + caloriesHit
                                        self.caloriesHitString = ""
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.bottom,10)
                            }.padding(.trailing,UIScreen.main.bounds.width/12)
                            VStack{
                                HStack{
                                    Text("RoleModel:")
                                        .bold()
                                        .font(.system(size: 15))
                                        .frame(width:UIScreen.main.bounds.width/4,height:25)
                                        .foregroundColor(.white)
                                        
                                        
                                    TextField("None", text: self.$roleModel)
                                        .foregroundColor(.white)
                                        .frame(width:UIScreen.main.bounds.width/4,height:25)
                                        .padding(.leading,-15)
                                        .font(.system(size:15))
                                }
                                HStack{
                                    NavigationLink(destination: RoleModelView(), isActive: $showRoleModelView) {
                                    }
                                    Button(action: {
                                        withAnimation {
                                            self.showRoleModelView.toggle()
                                        }
                                    }){
                                    Text("Choose RoleModel")
                                        .bold()
                                        .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                                        .background(Color("Color2"))
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                    }.buttonStyle(BorderlessButtonStyle())
                                    .padding(.bottom,10)
                                }
                            }.frame(minWidth: 0, maxWidth: .infinity)
                        }
                    }.background(Color("Color"))
                    .padding(.bottom,-10)
                    .padding(.top,-20)


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

                            
                            Spacer()

                            Button(action: {
                                withAnimation {
                                    self.addExercise.toggle()
                                }
                                }) {
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.white)
                                }.buttonStyle(BorderlessButtonStyle())
                        }.listRowBackground(Color("Color"))
                        
                        //grabs exercises and displays them with the option of deleting via sliding to the left
                        ForEach(exerciselist.items) { item in
                            HStack{
                                Text(item.name).foregroundColor(.white)
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("Lbs: \(item.weight)")
                                        .frame(width:75,height:20)
                                        .background(Color("Color2"))
                                        .foregroundColor(.white)
                                        .cornerRadius(3)
                                        .padding(.bottom,1)
                                    Text("Reps: \(item.reps)")                     .frame(width:75,height:20)
                                        .background(Color("Color2"))
                                        .foregroundColor(.white)
                                        .cornerRadius(3)
                                        .padding(.bottom,1)
                                    Text("Sets: \(item.sets)")
                                        .frame(width:75,height:20)
                                        .background(Color("Color2"))
                                        .foregroundColor(.white)
                                        .cornerRadius(3)
                                        .padding(.bottom,1)
                                }
                                Image(systemName: "chevron.left.2")
                                    .foregroundColor(.white)
                            }.listRowBackground(Color("Color"))
                        }
                        .onDelete(perform: deleteExercise)
                    }//.frame(maxWidth:.infinity)
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
        //exerciselist.items.remove(atOffsets: offsets)
        //print(something)
        //exerciselist.items.remove
    }
}

struct exerciseItem: Equatable, Identifiable {
    var id: Int
    var name: String
    var weight: String
    var reps: String
    var sets: String
}
class Exercise: ObservableObject {
    @Published var items = [exerciseItem]()


    func add(exercise: exerciseItem) {
        items.append(exercise)
    }

    func remove(exercise: exerciseItem)-> Int {
        print("hello")
        if let index = items.firstIndex(of: exercise) {
            //items.remove(at: index)
            print("hello1")
            return items.remove(at: index).id
        }
        return 0
    }
    func removeByID(exercise: exerciseItem) {
        //items.remove(exercise)
        //items.
    }
}

struct Label: View {
    var caloriesHit: Int = 0
    var calorieGoal: Int = 0
    var body: some View {
        ZStack {
            Text(String("\(caloriesHit)" + "/" + "\(calorieGoal)")).font(.system(size:15)).fontWeight(.heavy).colorInvert()
        }
    }
}

struct Outline: View {
    var percentage: CGFloat = 0
    var colors: [Color] = [Color.outlineColor]
    var body: some View {
        ZStack {
            Circle().fill(Color.clear)
                .frame(width:UIScreen.main.bounds.width/3,height:UIScreen.main.bounds.width/3)
                .overlay(
                    Circle()
                        .trim(from: 0, to: percentage * 0.01)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
                        .rotationEffect(Angle(degrees: 270))
                ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct Track: View {
    var colors: [Color] = [Color.trackColor]
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.backgroundColor)
                .frame(width:UIScreen.main.bounds.width/3,height:UIScreen.main.bounds.width/3)
                .overlay(
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 10))
                        .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                )
        }
    }
}



struct UserPageView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageView()
            .environmentObject(Exercise())
    }
}

