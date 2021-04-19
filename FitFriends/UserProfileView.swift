//
//  UserProfileView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/13/21.
//

import SwiftUI

//will eventually show user details 
struct UserProfileView: View {
    
    @State var height: String = ""
    @State var heightSaved: String = ""
    @State var weight: String = ""
    @State var weightSaved: String = ""
    @State var gender: String = ""
    @State var genderSaved: String = ""
    
    var body: some View {
        ZStack{
        //background color
            LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color2"),Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack {
        //FitFriends logo
            Image("Logo")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/2, height:UIScreen.main.bounds.height/4.5)
                .padding(.top,-(UIScreen.main.bounds.width/2))
            
        //vertical stack holding user stats
            VStack{
                VStack{
                    //horizontal stack holding height and save button
                    HStack(spacing: 15){
                        HStack{
                            Image(systemName: "ruler")
                            .resizable()
                            .frame(width:20, height: 15)
                            .foregroundColor(.black)
                            Text("Height:")
                        }
                        TextField("", text: self.$height)
                        Button(action: {
                            withAnimation {
                                self.heightSaved = height
                                self.height = heightSaved
                                
                                let group = DispatchGroup()
                                var msg = ""
                                group.enter()
                                setHeight(token, height){
                                    response in
                                    msg = response
                                    group.leave()
                                }
                                group.notify(queue: .main)
                                {
                                    sheight = height

                                    print("Height " + msg)
                                }
                            }
                        }){
                        Text("Save")
                            .bold()
                            .frame(width:UIScreen.main.bounds.width/4,height:30)
                            .background(Color("Color"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        }.buttonStyle(BorderlessButtonStyle())
                    }.padding(.vertical, 20)
                    
                    Divider().background(Color("Color"))
                    
                    //horizontal stack holding weight and save button
                    HStack(spacing: 15){
                        HStack{
                            Image(systemName: "scalemass")
                                .resizable()
                                .frame(width:20, height: 18)
                                .foregroundColor(.black)
                            Text("Weight:")
                        }
                        TextField("", text: self.$weight)
                        Button(action: {
                            withAnimation {
                                self.weightSaved = weight
                                self.weight = weightSaved
                                
                                let group = DispatchGroup()
                                var msg = ""
                                group.enter()
                                setWeight(token, weight){
                                    response in
                                    msg = response
                                    group.leave()
                                }
                                group.notify(queue: .main)
                                {
                                    sweight = weight

                                    print("Weight " + msg)
                                }
                                
                            }
                        }){
                        Text("Save")
                            .bold()
                            .frame(width:UIScreen.main.bounds.width/4,height:30)
                            .background(Color("Color"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        }.buttonStyle(BorderlessButtonStyle())
                    }.padding(.vertical, 20)

                    Divider().background(Color("Color"))
                    
                    //horizontal stack holding gender and save button
                    HStack(spacing: 15){
                        HStack{
                            Image(systemName: "person")
                            .resizable()
                            .frame(width:20, height: 18)
                            .foregroundColor(.black)
                            Text("Gender:")
                        }
                        TextField("", text: self.$gender)
                        Button(action: {
                            withAnimation {
                                self.genderSaved = gender
                                self.gender = genderSaved
                                
                                let group = DispatchGroup()
                                var msg = ""
                                group.enter()
                                setGender(token, gender){
                                    response in
                                    msg = response
                                    group.leave()
                                }
                                group.notify(queue: .main)
                                {
                                    sgender = gender

                                    print("Gender " + msg)
                                }
                            }
                        }){
                        Text("Save")
                            .bold()
                            .frame(width:UIScreen.main.bounds.width/4,height:30)
                            .background(Color("Color"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                        }.buttonStyle(BorderlessButtonStyle())
                    }.padding(.vertical, 20)
                }
                .padding(.vertical)
                .padding(.horizontal,20)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top,25)
            }.onAppear()
            {
                height = sheight
                weight = sweight
                gender = sgender
            }
            .padding(.top,-(UIScreen.main.bounds.width/5))
            }.padding()

        }.navigationTitle(Text((name)+"'s Stats"))
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
