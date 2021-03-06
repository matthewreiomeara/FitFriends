//
//  ExerciseListView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/13/21.
//

import SwiftUI
import Combine

struct ExerciseListView: View {
    let Chest: [chestExercises] = [
        .init(id: 0, exerciseName: "Flat Barbell or Dumbbell Bench Press",imageName: "chest"),
        .init(id: 1, exerciseName: "Incline Barbell or Dumbbell Bench Press",imageName: "chest"),
        .init(id: 2, exerciseName: "Decline Barbell or Dumbbell Bench Press",imageName: "chest"),
        .init(id: 3, exerciseName: "Flat Chest Press Machine",imageName: "chest"),
        .init(id: 4, exerciseName: "Incline Chest Press Machine",imageName: "chest"),
        .init(id: 5, exerciseName: "Decline Chest Press Machine",imageName: "chest"),
        .init(id: 6, exerciseName: "Flat Dumbbell Flyes",imageName: "chest"),
        .init(id: 7, exerciseName: "Incline Dumbbell Flyes",imageName: "chest"),
        .init(id: 8, exerciseName: "Decline Dumbbell Flyes",imageName: "chest"),
        .init(id: 9, exerciseName: "Cable Flyes",imageName: "chest"),
        .init(id: 10, exerciseName: "Flat Dumbbell Flyes",imageName: "chest"),
        .init(id: 11, exerciseName: "Push Ups",imageName: "chest"),
        
    ]
    let Triceps: [tricepExercises] = [
        .init(id: 12, exerciseName: "Dips",imageName: "triceps"),
        .init(id: 13, exerciseName: "Close Grip Bench Press",imageName: "triceps"),
        .init(id: 14, exerciseName: "Skull Crushers",imageName: "triceps"),
        .init(id: 15, exerciseName: "Cable Press-Downs",imageName: "triceps"),
        .init(id: 16, exerciseName: "Tricep Extensions",imageName: "triceps"),
    ]
    let Back: [backExercises] = [
        .init(id: 17, exerciseName: "Pull-Ups",imageName: "back"),
        .init(id: 18, exerciseName: "Chin-Ups",imageName: "back"),
        .init(id: 19, exerciseName: "Lat Pull-Downs",imageName: "back"),
        .init(id: 20, exerciseName: "Bent Over Rows",imageName: "back"),
        .init(id: 21, exerciseName: "Seated Cable Rows",imageName: "back"),
        .init(id: 22, exerciseName: "Machine Rows",imageName: "back"),
        .init(id: 23, exerciseName: "Shrugs",imageName: "back"),
    ]
    let Biceps: [bicepExercises] = [
        .init(id: 24, exerciseName: "Standing Barbell or Dumbbell Curls",imageName: "biceps"),
        .init(id: 25, exerciseName: "Seated Barbell or Dumbbell Curls",imageName: "biceps"),
        .init(id: 26, exerciseName: "Concentration Curls",imageName: "biceps"),
        .init(id: 27, exerciseName: "Cable Curls",imageName: "biceps"),
        .init(id: 28, exerciseName: "Hammer Curls",imageName: "biceps"),
        .init(id: 29, exerciseName: "Bicep Curl Machine",imageName: "biceps"),
    ]
    let Shoulders: [shoulderExercises] = [
        .init(id: 30, exerciseName: "Seated Overhead Barbell or Dumbbell Press",imageName: "shoulders"),
        .init(id: 31, exerciseName: "Standing Overhead Barbell or Dumbbell Press",imageName: "shoulders"),
        .init(id: 32, exerciseName: "Overhead Machine Press",imageName: "shoulders"),
        .init(id: 33, exerciseName: "Arnold Press",imageName: "shoulders"),
        .init(id: 34, exerciseName: "Barbell or Dumbbell Upright Rows",imageName: "shoulders"),
        .init(id: 35, exerciseName: "Lateral Raises",imageName: "shoulders"),
        .init(id: 36, exerciseName: "Front Raises",imageName: "shoulders"),
        .init(id: 37, exerciseName: "Rear Delt Flyes",imageName: "shoulders"),
    ]
    let Quads: [quadExercises] = [
        .init(id: 38, exerciseName: "Barbell or Dumbbell Squats",imageName: "quads"),
        .init(id: 39, exerciseName: "Barbell or Dumbbell Front Squats",imageName: "quads"),
        .init(id: 39, exerciseName: "Barbell or Dumbbell Split Squats",imageName: "quads"),
        .init(id: 40, exerciseName: "Barbell or Dumbbell Lunges",imageName: "quads"),
        .init(id: 41, exerciseName: "Leg Press",imageName: "quads"),
        .init(id: 42, exerciseName: "Single Leg Press",imageName: "quads"),
        .init(id: 43, exerciseName: "Hack Squat",imageName: "quads"),
        .init(id: 44, exerciseName: "Leg Extensions",imageName: "quads"),
    ]
    let Hamstrings: [hamstringExercises] = [
        .init(id: 45, exerciseName: "Straight Leg Deadlifts",imageName: "hamstrings"),
        .init(id: 46, exerciseName: "Glute-Ham Raises",imageName: "hamstrings"),
        .init(id: 47, exerciseName: "Leg Curls",imageName: "hamstrings"),
        .init(id: 48, exerciseName: "Deadlifts",imageName: "hamstrings"),
        
    ]
    let Calves: [calfExercises] = [
        .init(id: 49, exerciseName: "Calf Raises",imageName: "calves"),
        .init(id: 50, exerciseName: "Seated Calf Raises",imageName: "calves")
    ]
    let Abs: [abdominalExercises] = [
        .init(id: 51, exerciseName: "Sit-Ups",imageName: "abs"),
        .init(id: 52, exerciseName: "Crunches",imageName: "abs"),
        .init(id: 53, exerciseName: "Reverse Crunch",imageName: "abs"),
        .init(id: 54, exerciseName: "Flutter Kicks",imageName: "abs"),
        .init(id: 55, exerciseName: "Ab Roll-outs",imageName: "abs"),
        .init(id: 56, exerciseName: "Leg Raises",imageName: "abs"),
        .init(id: 57, exerciseName: "Knee Raises",imageName: "abs")
    ]
    
    var body: some View {
        //NavigationView {
        
        //list view displays all exercises along with pictures and names
            List {
                //two groups are required in order to fit more than 10 items in view
                Group {
                    //each HStack holds musclegroup name and rows displaying different exercises
                    
                    //chest HStack
                    HStack{
                    Text("Chest").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each chestExcerise and formats to a row
                    ForEach(Chest, id: \.id) {chestExercises in
                        NavigationLink(destination: chestExerciseDetail(exercise: chestExercises)) {
                            ChestExerciseRow(exercise: chestExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    //tricep HStack
                    HStack{
                    Text("Triceps").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each tricepExcerise and formats to a row
                    ForEach(Triceps, id: \.id) {tricepExercises in
                        NavigationLink(destination: tricepExerciseDetail(exercise: tricepExercises)) {
                            TricepExerciseRow(exercise: tricepExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    //back HStack
                    HStack{
                    Text("Back").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each backExcerise and formats to a row
                    ForEach(Back, id: \.id) {backExercises in
                        NavigationLink(destination: backExerciseDetail(exercise: backExercises)) {
                            BackExerciseRow(exercise: backExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    //bicep HStack
                    HStack{
                    Text("Biceps").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each bicepExcerise and formats to a row
                    ForEach(Biceps, id: \.id) {bicepExercises in
                        NavigationLink(destination: bicepExerciseDetail(exercise: bicepExercises)) {
                            BicepExerciseRow(exercise: bicepExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                }
                
                //second group holding rest of HStacks
                Group {
                    
                    //shoulder HStack
                    HStack{
                    Text("Shoulders").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each shoulderExcerise and formats to a row
                    ForEach(Shoulders, id: \.id) {shoulderExercises in
                        NavigationLink(destination: shoulderExerciseDetail(exercise: shoulderExercises)) {
                            ShoulderExerciseRow(exercise: shoulderExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    //quad HStack
                    HStack{
                    Text("Quadriceps").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each quadExcerise and formats to a row
                    ForEach(Quads, id: \.id) {quadExercises in
                        NavigationLink(destination: quadExerciseDetail(exercise: quadExercises)) {
                            QuadricepExerciseRow(exercise: quadExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    //hamstring HStack
                    HStack{
                    Text("Hamstrings").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each hamstringExcerise and formats to a row
                    ForEach(Hamstrings, id: \.id) {hamstringExercises in
                        NavigationLink(destination: hamstringExerciseDetail(exercise: hamstringExercises)) {
                            HamstringExerciseRow(exercise: hamstringExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    //calf HStack
                    HStack{
                    Text("Calves").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each calfExcerise and formats to a row
                    ForEach(Calves, id: \.id){calfExercises in
                        NavigationLink(destination: calfExerciseDetail(exercise: calfExercises)) {
                            CalfExerciseRow(exercise: calfExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    //abdominals HStack
                    HStack{
                    Text("Abdominals").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color"),width: 3)
                    .padding(.leading,-20)
                    
                    //grabs each abExcerise and formats to a row
                    ForEach(Abs, id: \.id) {abdominalExercises in
                        NavigationLink(destination: abdominalExerciseDetail(exercise: abdominalExercises)) {
                            AbdominalExerciseRow(exercise: abdominalExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                }
            
        }.navigationBarTitle("Exercises")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}
struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
    }
}
//row display for chest
struct ChestExerciseRow: View {
    let exercise: chestExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 5, leading: -15, bottom: 5, trailing: 0))
    }
}
//row display for triceps
struct TricepExerciseRow: View {
    let exercise: tricepExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
            Spacer()
        }.padding(.init(top: 5, leading: -15, bottom: 5, trailing: 0))
        
    }
}
//row display for back
struct BackExerciseRow: View {
    let exercise: backExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 5, leading: -15, bottom: 5, trailing: 0))
    }
}
//row display for biceps
struct BicepExerciseRow: View {
    let exercise: bicepExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 5, leading: -15, bottom: 5, trailing: 0))
    }
}
//row display for shoulders
struct ShoulderExerciseRow: View {
    let exercise: shoulderExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 5, leading: -15, bottom: 5, trailing: 0))
    }
}
//row display for quads
struct QuadricepExerciseRow: View {
    let exercise: quadExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 10, leading: -15, bottom: 10, trailing: 0))
    }
}
//row display for hamstrings
struct HamstringExerciseRow: View {
    let exercise: hamstringExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 10, leading: -15, bottom: 10, trailing: 0))
    }
}
//row display for calves
struct CalfExerciseRow: View {
    let exercise: calfExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 10, leading: -15, bottom: 10, trailing: 0))
    }
}
//row display for abdominals
struct AbdominalExerciseRow: View {
    let exercise: abdominalExercises
    var body: some View {
        HStack{
            Image(exercise.imageName)
            .resizable()
            .frame(width: 75, height: 75)
            .clipped()
            Text(exercise.exerciseName).font(.headline)
        }.padding(.init(top: 10, leading: -15, bottom: 10, trailing: 0))
    }
}

struct chestExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when chest exercise is chosen
struct chestExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: chestExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct tricepExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when tricep exercise is chosen
struct tricepExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: tricepExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct backExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when back exercise is chosen
struct backExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: backExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct bicepExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when bicep exercise is chosen
struct bicepExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: bicepExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct shoulderExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when shoulder exercise is chosen
struct shoulderExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: shoulderExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct quadExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when quad exercise is chosen
struct quadExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: quadExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct hamstringExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when hamstring exercise is chosen
struct hamstringExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: hamstringExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct calfExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when calf exercise is chosen
struct calfExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: calfExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}


struct abdominalExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
//detailView when abdominal exercise is chosen
struct abdominalExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    @State var weight = ""
    @State var reps = ""
    @State var sets = ""
    @State var addedExercise = false
    @State var e_id = "0"
    let exercise: abdominalExercises
    var body: some View {
        var id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseWeight = weight
        let exerciseReps = reps
        let exerciseSets = sets
        let exerciseID = exerciseItem(id: id,name: exerciseName,weight: exerciseWeight,reps:exerciseReps,sets:exerciseSets)
        Color("Color")
            .ignoresSafeArea(.all)
            .overlay(
                VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            HStack{
                Text("Lbs:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                    //.padding()
                    
                TextField("0", text: self.$weight)
                    .modifier(PlaceholderStyle(showPlaceHolder: weight.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(weight)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.weight = filtered
                        }
                    }

                Text("Reps:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    .padding(.leading,15)
                
                TextField("0", text: self.$reps)
                    .modifier(PlaceholderStyle(showPlaceHolder: reps.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(reps)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.reps = filtered
                        }
                    }

                Text("Sets:")
                    .bold()
                    .frame(width:75,height:50)
                    .background(Color("Color2"))
                    .foregroundColor(.white)
                    .border(Color("Color4"),width:2)
                    .cornerRadius(5)
                    

                TextField("0", text: self.$sets)
                    .modifier(PlaceholderStyle(showPlaceHolder: sets.isEmpty, placeholder: "0"))
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .onReceive(Just(sets)) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered != newValue {
                            self.sets = filtered
                        }
                    }

            }.padding(.top,20)
            NavigationLink(destination: UserPageView(), isActive: $addedExercise){
            }
            Button("Add Exercise") {
                var message = ""
                let exGroup = DispatchGroup()
                exGroup.enter()
                //Add old excercise to list
                addOldExercise(token, text1, Int(exerciseWeight) ?? 0, exerciseName, Int(exerciseSets) ?? 0, Int(exerciseReps) ?? 0){
                    response in
                    let dict = response
                    message = dict["message"] as! String
                    e_id = dict["e_id"] as! String
                    id = Int(e_id) ?? 0
                    exGroup.leave()
                }
                exGroup.notify(queue: .main)
                {
                    print("ERROR " + message + " E_ID: " + String(e_id))
                }
                exerciselist.add(exercise: exerciseID)
                self.addedExercise.toggle()
            }
            .font(.headline)
            .frame(width: UIScreen.main.bounds.width/2, height: 75)
            .foregroundColor(.white)
            .background(Color("Color2"))
            .border(Color("Color4"),width:4)
            .cornerRadius(5)
            .padding(.leading,-10)
            .padding(.top,20)
            .disabled(self.weight.isEmpty || self.reps.isEmpty || self.sets.isEmpty)
            Text("Please fill all blanks in order to add exercise").foregroundColor(Color.white).bold()
                .padding(.top, 10)

            }
            .background(Color("Color")).ignoresSafeArea(.all)
            .navigationBarTitle(exercise.exerciseName)
            .navigationBarTitleDisplayMode(.inline)
        )
    }
}

