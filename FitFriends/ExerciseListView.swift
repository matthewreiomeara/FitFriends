//
//  ExerciseListView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/13/21.
//

import SwiftUI

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
            List {
                Group {
                    HStack{
                    Text("Chest").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Chest, id: \.id) {chestExercises in
                        NavigationLink(destination: chestExerciseDetail(exercise: chestExercises)) {
                            ChestExerciseRow(exercise: chestExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    HStack{
                    Text("Triceps").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Triceps, id: \.id) {tricepExercises in
                        NavigationLink(destination: tricepExerciseDetail(exercise: tricepExercises)) {
                            TricepExerciseRow(exercise: tricepExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    HStack{
                    Text("Back").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Back, id: \.id) {backExercises in
                        NavigationLink(destination: backExerciseDetail(exercise: backExercises)) {
                            BackExerciseRow(exercise: backExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    HStack{
                    Text("Biceps").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Biceps, id: \.id) {bicepExercises in
                        NavigationLink(destination: bicepExerciseDetail(exercise: bicepExercises)) {
                            BicepExerciseRow(exercise: bicepExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                }
                
                Group {
                    
                    HStack{
                    Text("Shoulders").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Shoulders, id: \.id) {shoulderExercises in
                        NavigationLink(destination: shoulderExerciseDetail(exercise: shoulderExercises)) {
                            ShoulderExerciseRow(exercise: shoulderExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    HStack{
                    Text("Quadriceps").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Quads, id: \.id) {quadExercises in
                        NavigationLink(destination: quadExerciseDetail(exercise: quadExercises)) {
                            QuadricepExerciseRow(exercise: quadExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    HStack{
                    Text("Hamstrings").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Hamstrings, id: \.id) {hamstringExercises in
                        NavigationLink(destination: hamstringExerciseDetail(exercise: hamstringExercises)) {
                            HamstringExerciseRow(exercise: hamstringExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    HStack{
                    Text("Calves").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
                    ForEach(Calves, id: \.id){calfExercises in
                        NavigationLink(destination: calfExerciseDetail(exercise: calfExercises)) {
                            CalfExerciseRow(exercise: calfExercises)
                        }
                    }//.listRowBackground(Color("Color2"))
                    
                    HStack{
                    Text("Abdominals").font(.largeTitle)
                    }.frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/12)
                    .background(Color("Color"))
                    .foregroundColor(.white)
                    .padding(.leading,-20)
                    
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
struct chestExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: chestExercises
    var body: some View {
        let id = exercise.id
        let exerciseName = exercise.exerciseName
        let exerciseID = exerciseItem(id: id,name: exerciseName)
        VStack{
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct tricepExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct tricepExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: tricepExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct backExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct backExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: backExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct bicepExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct bicepExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: bicepExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct shoulderExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct shoulderExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: shoulderExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct quadExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct quadExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: quadExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct hamstringExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct hamstringExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: hamstringExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationBarTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct calfExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct calfExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: calfExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct abdominalExercises: Identifiable{
    var id: Int
    let exerciseName: String
    let imageName: String
}
struct abdominalExerciseDetail: View {
    @EnvironmentObject var exerciselist: Exercise
    let exercise: abdominalExercises
    var body: some View {
        VStack{
            let id = exercise.id
            let exerciseName = exercise.exerciseName
            let exerciseID = exerciseItem(id: id,name: exerciseName)
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
            Button("Add Exercise") {
                exerciselist.add(exercise: exerciseID)
            }
            .font(.headline)
        }
        .navigationTitle(exercise.exerciseName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
