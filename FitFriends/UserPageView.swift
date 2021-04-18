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
    @State var showBeginnerRoleModelView = false
    @State var showIntermediateRoleModelView = false
    @State var showAdvancedRoleModelView = false
    @State var selectedDate = Date()
    @State var isDateShown = false
    //formats date for UI purposes
    @State var caloriesHit: Int = 0
    @State var caloriesHitString: String = ""
    @State var caloriesHitFloat: CGFloat = 0
    
    @State var calorieGoalString: String = ""
    @State var calorieGoal: Int = 0
    @State var calorieGoalFloat: CGFloat = 0
    
    @State var caloriesRemovedString: String = ""
    @State var caloriesRemoved: Int = 0
    @State var caloriesRemovedFloat: CGFloat = 0
    

    @State var percentageToInt: Int = 0
    @State var finalPercentage: CGFloat = 0
    @State var addedCals : Int = 0
    @State var removedCals : Int = 0
    
    //@State var roleModel: String = ""
    
    //role model info, has a number and a title
    @EnvironmentObject var roleModel: roleModelInfo
    
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
                                    
                                    let entryGroup = DispatchGroup()
                                    var msg = ""
                                    entryGroup.enter()
                                    callOldEntry(token, text1){ response in
                                        // Do your stuff here
                                       //self.token = "Bearer " + response
                                        let dict = response
                                        msg = dict["error"]!
                                        exList = dict["exercise"] ?? ""
                                        calList = dict["calories"] ?? ""
                                        goal = dict["goal"] ?? ""
                                        entryGroup.leave()
                                    }
                                    entryGroup.notify(queue: .main){
                                        exerciselist.removeAll()
                                        if(msg != "error")
                                        {
                                            var arr = textToArray(text: exList)
                                            if(arr.contains("{"))
                                            {
                                                exerciselist.removeAll()
                                                while(!arr.isEmpty)
                                                {
                                                    let temp = convertToDictionary(text: String(arr[0]))

                                                    let eid = toString(temp!["e_id"])
                                                    
                                                    let tempEx = exerciseItem(id: Int(eid) ?? 0, name: toString(temp!["description"]), weight: toString(temp!["amount"]), reps: toString(temp!["reps"]), sets: toString(temp!["sets"]))
                                                    
                                                    exerciselist.add(exercise: tempEx)
                                                    arr.remove(at: 0)
                                                }
                                            }
                                            var arr3 = textToArray(text: exList)
                                            
                                //=============================================
                                            if(exList.contains("{"))
                                            {
                                                exerciselist.removeAll()
                                                while(!arr3.isEmpty)
                                                {
                                                    let temp = convertToDictionary(text: String(arr3[0]))

                                                    let eid = toString(temp!["e_id"])
                                                    
                                                    let tempEx = exerciseItem(id: Int(eid) ?? 0, name: toString(temp!["description"]), weight: toString(temp!["amount"]), reps: toString(temp!["reps"]), sets: toString(temp!["sets"]))
                                                    
                                                    exerciselist.add(exercise: tempEx)
                                                    arr3.remove(at: 0)
                                                }
                                            }
                                //=============================================
                                            var arr2 = textToArray(text: calList)
                                            if(calList.contains("{"))
                                            {
                                                var sum = 0
                                                
                                                while(!arr2.isEmpty)
                                                {
                                                    let temp = convertToDictionary(text: String(arr2[0]))

                                                    let cal = toString(temp!["amount"])
                                                    print("THIS IS " + cal)
                                                    
                                                    sum += Int(cal) ?? 0
                                                    
                                                    arr2.remove(at: 0)
                                                }
                                                
                                                caloriesHit = sum
                                                //print(caloriesHit)
                                                
                                                calorieGoal = Int(goal) ?? 0

                                                
                                                
                                                
                                                
                                            }
                                            print("NEW ENTRY ADDED " + text1)
                                        }
                                        else{
                                            print("Error occured")
                                        }
                                    }
                                    
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
                    }.onAppear(){
                        
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
                                
                                
                                if roleModel.roleModel == 1 {
                                    Image("beginner")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:UIScreen.main.bounds.width/3,height:UIScreen.main.bounds.width/3)
                                } else if roleModel.roleModel == 2 {
                                    Image("intermediate")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:UIScreen.main.bounds.width/3,height:UIScreen.main.bounds.width/3)
                                } else if roleModel.roleModel == 3 {
                                    Image("advanced")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:UIScreen.main.bounds.width/3,height:UIScreen.main.bounds.width/3)
                                } else {
                                    Image("empty")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width:UIScreen.main.bounds.width/3,height:UIScreen.main.bounds.width/3)
                                }
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

                                    TextField("0", text: self.$calorieGoalString)
                                        .modifier(PlaceholderStyle(showPlaceHolder: calorieGoalString.isEmpty, placeholder: "0"))
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
                                        
                                        let group = DispatchGroup()
                                        var msg = ""
                                        group.enter()
                                        getCaloriesGoal(token, text1, calorieGoal){
                                            response in
                                            msg = response
                                            group.leave()
                                        }
                                        group.notify(queue: .main)
                                        {
                                            
                                            let entryGroup = DispatchGroup()
                                            entryGroup.enter()
                                            callOldEntry(token, text1){ response in
                                                // Do your stuff here
                                               //self.token = "Bearer " + response
                                                let dict = response
                                                calList = dict["calories"] ?? ""
                                                entryGroup.leave()
                                            }
                                            entryGroup.notify(queue: .main){
                                                
                                                
                                                var sum = 0
                                                var arr2 = textToArray(text: calList)
                                                if(calList.contains("{"))
                                                {
                                                    
                                                    while(!arr2.isEmpty)
                                                    {
                                                        let temp = convertToDictionary(text: String(arr2[0]))

                                                        let cal = toString(temp!["amount"])
                                                        print("THIS IS " + cal)
                                                        
                                                        sum += Int(cal) ?? 0
                                                        
                                                        arr2.remove(at: 0)
                                                    }
                                                }
                                                
                                                var mes = ""
                                                let addGroup = DispatchGroup()
                                                addGroup.enter()
                                                addOldCalories(token,text1, -1 * sum, "a", "b"){ response in
                                                    //Saves the response as a dictionary
                                                    mes = response

                                                    addGroup.leave()
                                                 }

                                                addGroup.notify(queue: .main) {
                                                    
                                                    goal = String(calorieGoal)
                                                    
                                                    calorieGoalString = goal
                                                        
                                                    calorieGoal = Int(goal) ?? 0

                                                    print("UPDATE " + msg)
                                                    print("Set CalList")
                                                    //Update some textfield using the dailyInfo
                                                    print("THIS : " + mes)
                                                 }
                                            
                                            }
    
//                                            goal = String(calorieGoal)
//
//                                            calorieGoalString = goal
//
//                                            calorieGoal = Int(goal) ?? 0
//
//                                            print("UPDATE " + msg)
                                        }
                                        
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

                                    TextField("0", text: self.$caloriesHitString)
                                        .modifier(PlaceholderStyle(showPlaceHolder: caloriesHitString.isEmpty, placeholder: "0"))
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
                                        
                                        var mes = ""
                                        let addGroup = DispatchGroup()
                                        addGroup.enter()
                                        addOldCalories(token,text1, addedCals, "a", "b"){ response in
                                            //Saves the response as a dictionary
                                            mes = response

                                            addGroup.leave()
                                         }

                                        addGroup.notify(queue: .main) {
                                            //Update some textfield using the dailyInfo
                                            print("THIS : " + mes)
                                         }
                                        
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.white)
                                    }
                                }
                                //non completed stack for removing calories if implemented
                               // HStack {
//                                    Text("Remove Calories:")
//                                        .bold()
//                                        .font(.system(size: 15))
//                                        .frame(width:UIScreen.main.bounds.width/4,height:25)
//                                        .foregroundColor(.white)
//
//                                    TextField("0", text: self.$caloriesRemovedString)
//                                        .modifier(PlaceholderStyle(showPlaceHolder: caloriesRemovedString.isEmpty, placeholder: "0"))
//                                        .foregroundColor(.white)
//                                        .keyboardType(.numberPad)
//                                        .onReceive(Just(caloriesRemovedString)) { newValue in
//                                            let filtered = newValue.filter { "0123456789".contains($0) }
//                                            if filtered != newValue {
//                                                self.caloriesRemovedString = filtered
//                                            }
//                                        }
//                                        .frame(width: UIScreen.main.bounds.width/10)
//                                        .padding(.leading,-10)
//                                    Button(action: {
//                                        //grab string int and turn into int or 0
//                                        self.removedCals = Int(caloriesHitString) ?? 0
//                                        //turn both inputs into float
//                                        self.caloriesRemovedFloat = CGFloat(removedCals)
//                                        self.calorieGoalFloat = CGFloat(calorieGoal)
//                                        //get percentage
//                                        self.finalPercentage = (caloriesRemovedFloat/calorieGoalFloat) + finalPercentage/100
//                                        //turn percentage into correct float
//                                        self.finalPercentage = finalPercentage * 100
//                                        //grab calories inputted
//                                        //self.caloriesHit
//                                        self.caloriesHit = caloriesHit - removedCals
//                                        self.caloriesHitString = ""
//
//                                        var mes = ""
//                                        let addGroup = DispatchGroup()
//                                        addGroup.enter()
//                                        addOldCalories(token,text1, addedCals, "a", "b"){ response in
//                                            //Saves the response as a dictionary
//                                            mes = response
//
//                                            addGroup.leave()
//                                         }
//
//                                        addGroup.notify(queue: .main) {
//                                            //Update some textfield using the dailyInfo
//                                            print("THIS : " + mes)
//                                         }
//
//                                    }) {
//                                        Image(systemName: "plus.circle.fill")
//                                            .foregroundColor(.white)
//                                    }
//                                }
                              
                                .padding(.bottom,10)
                            }.padding(.trailing,UIScreen.main.bounds.width/12)
                            VStack{
                                HStack{
                                    Text("Role Model:")
                                        .bold()
                                        .font(.system(size: 15))
                                        .frame(width:UIScreen.main.bounds.width/4,height:25)
                                        .foregroundColor(.white)
                                    
                                        
                                        
                                    TextField("None", text: self.$roleModel.roleModelTitle)
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
                                    Text("Choose Role Model")
                                        .bold()
                                        .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                                        .background(Color("Color2"))
                                        .foregroundColor(.white)
                                        .cornerRadius(5)
                                    }.buttonStyle(BorderlessButtonStyle())
                                    .padding(.bottom,10)
                                }
                                HStack{
                                    NavigationLink(destination: beginnerRoleModelView(), isActive: $showBeginnerRoleModelView) {
                                    }
                                    NavigationLink(destination: intermediateRoleModelView(), isActive: $showIntermediateRoleModelView) {
                                    }
                                    NavigationLink(destination: advancedRoleModelView(), isActive: $showAdvancedRoleModelView) {
                                    }
                                    Button(action: {
                                        withAnimation {
                                            if roleModel.roleModel == 1 {
                                                self.showBeginnerRoleModelView.toggle()
                                            } else if roleModel.roleModel == 2 {
                                                self.showIntermediateRoleModelView.toggle()
                                            } else if roleModel.roleModel == 3 {
                                                self.showAdvancedRoleModelView.toggle()
                                            } else {
                                                
                                            }
                                        }
                                    }){
                                        if roleModel.roleModel == 0 {
                                            Text("No Plan Available")
                                                .font(.system(size: 15,weight:.bold))
                                                .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                                                .background(Color("Color2"))
                                                .foregroundColor(.white)
                                                .cornerRadius(5)
                                        } else {
                                        Text("View " + roleModel.roleModelTitle + " Plan")
                                            .font(.system(size: 15,weight:.bold))
                                            .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                                            .background(Color("Color2"))
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                        }
                                    
                                    }.buttonStyle(BorderlessButtonStyle())
                                }.padding(.bottom,20)
                            }.frame(minWidth: 0, maxWidth: .infinity)
                        }
                    }
                    .background(Color("Color"))
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
                            .navigationTitle("FitFriends")
                            .navigationBarTitleDisplayMode(.inline)

                            
                            Spacer()

                            Button(action: {
                                withAnimation {
                                    self.addExercise.toggle()
                                    

                                }
                                }) {
                                    Image(systemName: "plus.circle.fill")
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
                .navigationBarTitle("FitFriends", displayMode: .inline)
                    .navigationBarItems(trailing:
                        HStack(spacing: 15) {
                            
                            
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
        .onAppear(){
            roleModel.roleModel = rmodel
            roleModel.roleModelTitle = model
        }
        .onAppear(){
            
            let entryGroup = DispatchGroup()
            entryGroup.enter()
            callOldEntry(token, text1){ response in
                // Do your stuff here
               //self.token = "Bearer " + response
                let dict = response
                exList = dict["exercise"] ?? ""
                calList = dict["calories"] ?? ""
                goal = dict["goal"] ?? ""
                entryGroup.leave()
            }
            entryGroup.notify(queue: .main){
                var arr = textToArray(text: exList)
                exerciselist.removeAll()
    //=============================================
                if(exList.contains("{"))
                {
                    exerciselist.removeAll()
                    while(!arr.isEmpty)
                    {
                        let temp = convertToDictionary(text: String(arr[0]))

                        let eid = toString(temp!["e_id"])
                        
                        let tempEx = exerciseItem(id: Int(eid) ?? 0, name: toString(temp!["description"]), weight: toString(temp!["amount"]), reps: toString(temp!["reps"]), sets: toString(temp!["sets"]))
                        
                        exerciselist.add(exercise: tempEx)
                        arr.remove(at: 0)
                    }
                }
                print("List updated")
            }
            
//=============================================
            var arr2 = textToArray(text: calList)
            if(calList.contains("{"))
            {
                var sum = 0
                
                while(!arr2.isEmpty)
                {
                    let temp = convertToDictionary(text: String(arr2[0]))

                    let cal = toString(temp!["amount"])
                    print("THIS IS " + cal)
                    
                    sum += Int(cal) ?? 0
                    
                    arr2.remove(at: 0)
                }
                
                caloriesHit = sum
                caloriesHitString = "0"
                calorieGoalString = goal
                
                calorieGoal = Int(goal) ?? 0
                //print(calorieGoal)
                self.caloriesHitFloat = CGFloat(caloriesHit)
                self.calorieGoalFloat = CGFloat(calorieGoal)
                //get percentage
                self.finalPercentage = (caloriesHitFloat/calorieGoalFloat) + finalPercentage/100
                //turn percentage into correct float
                self.finalPercentage = finalPercentage * 100
                
                
            }
            
        }
    }
    func deleteExercise(at offsets: IndexSet){
        var copy = [exerciseItem]()
        for i in 0 ..< exerciselist.items.count
        {
            copy.append(exerciselist.items[i])
        }
        
        exerciselist.items.remove(atOffsets: offsets)

        var eid = -1
        for i in 0 ..< exerciselist.items.count
        {
            if(exerciselist.items[i].id != copy[i].id)
            {
                eid = copy[i].id
                break
            }
        }
        
        if (eid == -1)
        {
            eid = copy[copy.count-1].id
        }
        print(eid)
        
        let group = DispatchGroup()
        var msg = ""
        group.enter()
        removeExercise(token, eid)
        {
            response in
            msg = response
            group.leave()
        }
        
        group.notify(queue: .main)
        {
            print("DELETE " + msg)
        }
        
        
    }
}

func toString(_ value: Any?) -> String {
  return String(describing: value ?? "")
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
    
    func removeAll()
    {
        while(items.count != 0)
        {
            items.remove(at: 0)
        }
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
                ).animation(.spring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0))
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
public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
            }
            content
            .foregroundColor(Color.white)
        }
    }
}

class roleModelInfo: ObservableObject {
    @Published var roleModel = 0
    @Published var roleModelTitle = "None"
}



struct UserPageView_Previews: PreviewProvider {
    static var previews: some View {
        UserPageView()
            .environmentObject(Exercise())
    }
}

