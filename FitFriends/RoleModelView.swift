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
    var body: some View {
        NavigationView {
            VStack{
                Button(action: {
                    withAnimation {
                        roleModel.roleModel = 1
                        roleModel.roleModelTitle = "Beginner"
                    }
                }){
                    Text("Choose Beginner")
                        .bold()
                        .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                        .background(Color("Color2"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }.buttonStyle(BorderlessButtonStyle())
                .padding(.bottom,10)
                
                Button(action: {
                    withAnimation {
                        roleModel.roleModel = 2
                        roleModel.roleModelTitle = "Intermediate"
                    }
                }){
                    Text("Choose Intermediate")
                        .bold()
                        .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                        .background(Color("Color2"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }.buttonStyle(BorderlessButtonStyle())
                .padding(.bottom,10)
                
                Button(action: {
                    withAnimation {
                        roleModel.roleModel = 3
                        roleModel.roleModelTitle = "Advanced"
                    }
                }){
                    Text("Choose Expert")
                        .bold()
                        .frame(width:UIScreen.main.bounds.width/2.25,height:30)
                        .background(Color("Color2"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }.buttonStyle(BorderlessButtonStyle())
                .padding(.bottom,10)
            }
        }
        //.navigationTitle("")
        //.navigationBarHidden(true)
    }
}

struct RoleModelView_Previews: PreviewProvider {
    static var previews: some View {
        RoleModelView()
    }
}
