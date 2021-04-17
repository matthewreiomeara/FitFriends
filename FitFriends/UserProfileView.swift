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
    @State var weight: String = ""
    @State var gender: String = ""
    
    var body: some View {
        ZStack{
            Color("Color").ignoresSafeArea(.all)
            VStack {
        //FitFriends logo
            Image("Logo")
                .resizable()
                .frame(width: UIScreen.main.bounds.width/2, height:UIScreen.main.bounds.height/4.5)
                .padding(.top,-(UIScreen.main.bounds.width/2))
            
            VStack{
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "ruler")
                            .resizable()
                            .frame(width:20, height: 15)
                            .foregroundColor(.black)
                        TextField("Height", text: self.$height)
                    }.padding(.vertical, 20)
                    
                    Divider()
                    
                    HStack(spacing: 15){
                        Image(systemName: "scalemass")
                            .resizable()
                            .frame(width:20, height: 18)
                            .foregroundColor(.black)
                        TextField("Weight", text: self.$height)
                    }.padding(.vertical, 20)

                    Divider()
                    
                    HStack(spacing: 15){
                        Image(systemName: "person")
                            .resizable()
                            .frame(width:20, height: 18)
                            .foregroundColor(.black)
                        TextField("Gender", text: self.$gender)
                    }.padding(.vertical, 20)
                }
                .padding(.vertical)
                .padding(.horizontal,20)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top,25)
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
