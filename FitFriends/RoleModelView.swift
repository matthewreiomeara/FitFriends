//
//  RoleModelView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/13/21.
//

import SwiftUI

//will eventually display a list like exerciselist but with different rolemodels and their exercise plans
struct RoleModelView: View {
    //@State var roleModel: Int = 0
    @EnvironmentObject var roleModel: roleModelInfo
    @State var roleModelPicked: Bool = false
    
    var body: some View {
        ZStack {
            Color("Color2").ignoresSafeArea(.all)
            
            VStack {
                
                HStack {
                    Text("Role Models").font(.largeTitle)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/5, alignment: .center)
                        .foregroundColor(.white)
                }.background(Color("Color"))
                .padding(.top,(UIScreen.main.bounds.width/8))
                .padding(.leading,10)
                .padding(.trailing,10)
                .border(Color("Color4"),width: 2)

                
                HStack{
                    VStack {
                        Image("beginner")
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6)
                            .padding(.leading,-20)
                    }
                    VStack {
                        NavigationLink(destination: beginnerRoleModelView()){
                            Text("See Beginner Workout Plan").font(.system(size: 15,weight:.bold))
                                .padding(.leading,10)
                            Image(systemName: "chevron.right.2")
                        }
                        .padding(.bottom,10)
                    Button(action: {
                        withAnimation {
                            
                            //Sets the role modeel
                            let aGroup = DispatchGroup()
                            
                            var message = ""
                            aGroup.enter()
                            setRoleModel(token,"Beginner") { response in
                                //Saves the response as a dictionary
                                rmodel = 1
                                message = response
                                aGroup.leave()
                            }
                            
                            // Waits for request to finish
                            aGroup.notify(queue: .main) {
                                print("model" + message)
                            }
                            
                            roleModel.roleModel = 1
                            roleModel.roleModelTitle = "Beginner"
                            self.roleModelPicked.toggle()
                        }
                    }) {
                        Text("Set Role Model")
                            .bold()
                            .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                            .background(Color("Color"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }.buttonStyle(BorderlessButtonStyle())
                    .padding(.bottom,10)
                    }
                }
                .padding(.top,UIScreen.main.bounds.height/28)
                .padding(.bottom,UIScreen.main.bounds.height/28)

                
                Divider()
                
                HStack{
                    VStack {
                        Image("intermediate")
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6)
                            .padding(.leading,-20)
                    }
                    VStack {
                        NavigationLink(destination: intermediateRoleModelView()){
                            Text("See Intermediate Workout Plan").font(.system(size: 14, weight: .bold))
                            Image(systemName: "chevron.right.2")
                        }
                        .padding(.bottom,10)
                        Button(action: {
                            withAnimation {
                                
                                //Sets the role modeel
                                let aGroup = DispatchGroup()
                                
                                var message = ""
                                aGroup.enter()
                                setRoleModel(token,"Beginner") { response in
                                    //Saves the response as a dictionary
                                    message = response
                                    aGroup.leave()
                                }
                                
                                // Waits for request to finish
                                aGroup.notify(queue: .main) {
                                    rmodel = 2
                                    print("model" + message)
                                }
                                
                                roleModel.roleModel = 2
                                roleModel.roleModelTitle = "Intermediate"
                            }
                        }) {
                            Text("Set as Role Model")
                                .bold()
                                .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                                .background(Color("Color"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }.buttonStyle(BorderlessButtonStyle())
                        .padding(.bottom,10)
                    }

                }
                .padding(.top,UIScreen.main.bounds.height/32)
                .padding(.bottom,UIScreen.main.bounds.height/32)
                
                Divider()
                
                HStack{
                    VStack {
                        Image("advanced")
                            .resizable()
                            .frame(width:UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/6)
                            .padding(.leading,-20)
                    }
                    VStack {
                        NavigationLink(destination: advancedRoleModelView()){
                            Text("See Advanced Workout Plan").font(.system(size: 15,weight:.bold))
                                .padding(.leading,10)
                            Image(systemName: "chevron.right.2")
                        }
                        .padding(.bottom,10)
                        Button(action: {
                            withAnimation {
                                
                                //Sets the role modeel
                                let aGroup = DispatchGroup()
                                
                                var message = ""
                                aGroup.enter()
                                setRoleModel(token,"Beginner") { response in
                                    //Saves the response as a dictionary
                                    rmodel = 3
                                    message = response
                                    aGroup.leave()
                                }
                                
                                // Waits for request to finish
                                aGroup.notify(queue: .main) {
                                    print("model" + message)
                                }
                                
                                roleModel.roleModel = 3
                                roleModel.roleModelTitle = "Advanced"
                                self.roleModelPicked.toggle()
                            }
                        }) {
                            Text("Set as Role Model")
                                .bold()
                                .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                                .background(Color("Color"))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }.buttonStyle(BorderlessButtonStyle())
                        .padding(.bottom,10)
                    }
                }.padding(.top,UIScreen.main.bounds.height/32)
                .padding(.bottom,UIScreen.main.bounds.height/32)
                
                Divider()
                
                HStack{
                    Text("").frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/5)
                }.background(Color("Color"))
            }

        }
    }
}

struct RoleModelView_Previews: PreviewProvider {
    static var previews: some View {
        RoleModelView()
    }
}






struct beginnerRoleModelView: View {
    let beginnerMonday = ["Flat Dumbbell or Barbell Bench Press",
                          "Dips",
                          "Tricep Extensions",
                          "Cable Press-Downs",
                          "Cable/Dumbbell Flyes",
                          "Push Ups"]
    
    let beginnerTuesday = ["Barbell or Dumbbell Squats",
                           "Leg Press",
                           "Leg Extensions",
                           "Leg Curls",
                           "Calf Raises"]
    
    let beginnerThursday = ["Lat Pull-Downs",
                            "Seated Cable Rows",
                            "Pull-Ups",
                            "Standing Barbell or Dumbbell Curls",
                            "Hammer Curls",
                            "Concentration Curls"]
    
    let beginnerFriday = ["Standing Overhead Barbell Press",
                          "Barbell or Dumbbell Upright Rows",
                          "Shrugs",
                          "Lateral Raises",
                          "Front Raises",
                          "Rear Delt-Flyes"]


    var body: some View {
        List {
            Section(header: Text("Monday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(beginnerMonday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Tuesday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(beginnerTuesday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Wednesday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                Text("Rest Day")
            }
            Section(header: Text("Thursday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(beginnerThursday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Friday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(beginnerFriday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Saturday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                Text("Rest Day")
            }
            Section(header: Text("Sunday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)){
                Text("Rest Day")
            }

        }.listStyle(GroupedListStyle()).navigationTitle("Beginner Workout Plan").navigationBarTitleDisplayMode(.inline)
    }
}

struct intermediateRoleModelView: View {
    let intermediateMonday = ["Flat Dumbbell or Barbell Bench Press",
                          "Incline Dumbbell or Barbell Bench Press",
                          "Dips",
                          "Flat Chess Press Machine",
                          "Decline Chest Press Machine",
                          "Cable/Dumbbell Flyes",
                          "Push Ups"]
    
    let intermediateTuesday = ["Barbell or Dumbbell Squats",
                           "Barbell or Dumbbell Lunges",
                           "Straight Leg Deadlift",
                           "Leg Press",
                           "Single Leg Press",
                           "Leg Extensions",
                           "Leg Curls",
                           "Calf Raises"]
    
    let intermediateFriday = [
                                "Close Grip Bench Press",
                                "Skull Crushers",
                                "Tricep Extensions",
                                "Cable Press-Downs",
                                "Standing Barbell or Dumbbell Curls",
                                "Seated Dumbbell Curls",
                                "Bicep Curl Machine",
                                "Concentration Curls"]
    
    let intermediateThursday = ["Bent Over Rows",
                            "Lat Pull-Downs",
                            "Machine Rows",
                            "Pull-Ups",
                            "Dumbbell Rows",
                            "Seated Cable Rows",
                            ]
    
    let intermediateWednesday = ["Standing Overhead Barbell Press",
                          "Barbell or Dumbbell Upright Rows",
                          "Shrugs",
                          "Arnold Press",
                          "Lateral Raises",
                          "Front Raises",
                          "Rear Delt-Flyes"]


    var body: some View {
        List {
            Section(header: Text("Monday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(intermediateMonday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Tuesday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(intermediateTuesday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Wednesday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(intermediateWednesday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Thursday").foregroundColor(.white)
                        .font(.system(size: 20))
                        .padding(.bottom,15))
                        {
                ForEach(intermediateThursday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Friday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(intermediateFriday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Saturday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                Text("Rest Day")
            }
            Section(header: Text("Sunday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                Text("Rest Day")
            }

        }.listStyle(GroupedListStyle()).navigationTitle("Intermediate Workout Plan").navigationBarTitleDisplayMode(.inline)
    }
}

struct advancedRoleModelView: View {
    let advancedMonday = ["Flat Dumbbell or Barbell Bench Press",
                          "Incline Dumbbell or Barbell Bench Press",
                          "Decline Dumbbell or Barbell Bench Press",
                          "Standing Overhead Barbell Press",
                          "Cable Press-Downs",
                          "Cable/Dumbbell Flyes",
                          "Push Ups"]
    
    let advancedTuesday = [
                           "Bent Over Rows",
                           "Pull-Ups",
                           "Lat Pull-Downs",
                           "Machine Row",
                           "Seated Cable Rows",
                           "Shrugs"]
    
    let advancedWednesday = ["Barbell Squat",
                            "Deadlifts",
                            "Straight Leg Deadlifts",
                            "Leg Press",
                            "Barbell or Dumbbell Lunges",
                            "Calf Raises"]
    
    let advancedThursday = ["Flat Dumbbell or Barbell Bench Press",
                          "Incline Dumbbell or Barbell Bench Press",
                          "Decline Dumbbell or Barbell Bench Press",
                          "Standing Overhead Barbell Press",
                          "Cable Press-Downs",
                          "Cable/Dumbbell Flyes",
                          "Push Ups"]
    
    let advancedFriday = ["Pull-Ups",
                            "Bent Over Rows",
                            "Lat Pull-Downs",
                            "Machine Row",
                            "Seated Cable Rows",
                            "Shrugs"]
    
    let advancedSaturday = ["Deadlifts",
                          "Barbell Front Squats",
                          "Straight Leg Deadlifts",
                          "Leg Press",
                          "Barbell or Dumbbell Lunges",
                          "Seated Calf Raises"]


    var body: some View {
        List {
            Section(header: Text("Monday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)){
                ForEach(advancedMonday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Tuesday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(advancedTuesday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Wednesday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(advancedWednesday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Thursday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(advancedThursday, id:\.self) {
                    Text($0)
                }

            }
            Section(header: Text("Friday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)){
                ForEach(advancedFriday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Saturday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                ForEach(advancedSaturday, id:\.self) {
                    Text($0)
                }
            }
            Section(header: Text("Sunday").foregroundColor(.white).font(.system(size: 20)).padding(.bottom,15)) {
                Text("Rest Day")
            }

        }.listStyle(GroupedListStyle()).navigationTitle("Advanced Workout Plan").navigationBarTitleDisplayMode(.inline)
    }
}

