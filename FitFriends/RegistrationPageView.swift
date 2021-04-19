
//  RegistrationPage.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 3/20/21.
//
import SwiftUI
import Alamofire
import SwiftyJSON
import Foundation

struct RegistrationPageView: View {
        @State var color = Color.black.opacity(0.5)
        @State var user = ""
        @State var pass = ""
        @State var email = ""
        @State var retypePass = ""
        @State var visible1 = false
        @State var visible2 = false
        @Binding var show : Bool
        @State var alert = false
        @State var error = ""
        @State var loading = false
        let myGroup = DispatchGroup()
        @State var message = ""

        var body :some View{
            ZStack {
                LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color2"),Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack {
                //FitFriends logo
                Image("Logo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/2, height:UIScreen.main.bounds.height/4.5)
                
                //horizontal stack holding and new buttons
                HStack{
                    //existing button
                    Button(action: {
                        self.show.toggle()
                    }) {
                        Text("Existing")
                            .foregroundColor(!self.show ? .black : .white)
                            .fontWeight(.bold)
                            .padding(.vertical,10)
                            .frame(width: (UIScreen.main.bounds.width/2.5))
                        
                    }.background(!self.show ? Color.white: Color.clear)
                    .clipShape(Capsule())
                    
                    //new button
                    Button(action: {
                    }) {
                        Text("New")
                            .foregroundColor(self.show ? .black : .white)
                            .fontWeight(.bold)
                            .padding(.vertical,10)
                            .frame(width: (UIScreen.main.bounds.width/2.5))
                        
                    }.background(self.show ? Color.white: Color.clear)
                    .clipShape(Capsule())
                }
                .background(Color.black.opacity(0.1))
                .clipShape(Capsule())
                .padding(.top, 25)
                    
                        //vertical stack holding all inputs
                        VStack{
                            //horizontal stack holding username
                            HStack(spacing: 15){
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width:16, height:13)
                                    .foregroundColor(.black)
                                TextField("Enter Username", text: self.$user).autocapitalization(.none)
                            }.padding(.vertical, 10)
                            
                            Divider().background(Color("Color"))
                            //horizontal stack for email address box
                            HStack(spacing: 15){
                                Image(systemName: "envelope")
                                    .resizable()
                                    .frame(width:16, height:13)
                                    .foregroundColor(.black)
                                TextField("Enter Email Address", text: self.$email).autocapitalization(.none)
                            }.padding(.vertical, 10)
                            
                            Divider().background(Color("Color"))
                            
                            //horizontal stack for password box
                            HStack(spacing: 15){
                                Image(systemName: "lock")
                                    .resizable()
                                    .frame(width:15, height:18)
                                    .foregroundColor(.black)
                                if self.visible1{
                                    TextField("Enter Password", text: self.$pass).autocapitalization(.none)
                                } else {
                                    SecureField("Enter Password", text: self.$pass).autocapitalization(.none)
                                }
                                Button(action: {
                                    self.visible1.toggle()
                                }) {
                                    Image(systemName: self.visible1 ? "eye" : "eye.slash")
                                        .foregroundColor(.black)
                                }
                            }.padding(.vertical, 10)
                            
                            Divider().background(Color("Color"))
                            
                            //horizontal stack for re-enter password box
                            HStack(spacing: 15){
                                Image(systemName: "lock")
                                    .resizable()
                                    .frame(width:15, height:18)
                                    .foregroundColor(.black)
                                if self.visible2{
                                    TextField("Re-Enter Password", text: self.$retypePass).autocapitalization(.none)
                                } else {
                                    SecureField("Re-Enter Password", text: self.$retypePass).autocapitalization(.none)
                                }
                                Button(action: {
                                    self.visible2.toggle()
                                }) {
                                    Image(systemName: self.visible2 ? "eye" : "eye.slash")
                                        .foregroundColor(.black)
                                }
                            }.padding(.vertical, 10)
                            
                            Divider().background(Color("Color"))
                        }
                        //add padding vertical stack holding email,pass,re-enter
                        .padding(.vertical)
                        .padding(.horizontal,20)
                        .padding(.bottom,40)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.top,25)
                        
                        //button for signup
                        Button(action: {
                            checkInputs()
                            myGroup.enter();
                            
                            trySignUp(self.user, self.email, self.pass, self.retypePass){ response in
                                // Do your stuff here
                                self.message = response
                                myGroup.leave()
                            }

//                            Waits for request to finish
                            myGroup.notify(queue: .main) {

                                if (self.message == "success")
                                {
                                    withAnimation {
                                        self.loading.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                            self.show.toggle()
                                        }
                                        //self.show.toggle()
                                    }//Move back to login here
                                }
                                else
                                {
                                    self.error = "User already exists with this email."
                                    self.alert.toggle()
                                }
                            }

                        }){
                            Text("SIGNUP")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 100)
                        }.background(Color.init("Color"))
                        .cornerRadius(8)
                        .offset(y: -40)
                        .padding(.bottom,-40)
                        .shadow(radius: 25)


                }
                .padding()
                //if errors then this will trigger
                if self.alert{
                    ViewError(alert: self.$alert, error: self.$error)
                }
                //if no errors then this will trigger
                if loading {
                    LoadView(placeHolder: "Registering..", show: $loading)
                }
            }
            
        }
    //checking valid inputs
        func checkInputs(){
            if self.user != "" && self.email != "" &&  self.pass != "" && self.retypePass != "" {
                if(!isValidUserName(self.user)){
                    self.error = "Usernames must be less than 21 characters."
                    self.alert.toggle()
                } else if (!isValidEmail(self.email)){
                    self.error = "Not a valid email address."
                    self.alert.toggle()
                } else if (isValidPassword(self.pass)==1){
                    self.error = "Passwords must contain 6 - 21 characters."
                    self.alert.toggle()
                } else if(isValidPassword(self.pass)==2){
                    self.error = "Passwords must contain 1 capital letter and 1 number."
                    self.alert.toggle()
                } else if(self.retypePass != self.pass){
                    self.error = "Passwords do not match."
                    self.alert.toggle()
                }
            } else {
                self.error = "Please fill in all blanks in order to register."
                self.alert.toggle()
            }
        }
    }


func trySignUp(_ username: String, _ email: String, _ password: String, _ reEnterPass: String, _ completion: @escaping (String) -> Void){

    //URL with endpoint to sent to
    let url2 = "https://fit-friends.herokuapp.com/api/user/signup"
    //Parameters to input
    var params2 = ["name": "", "email": "", "password": ""]

////-------------------------------------------------------------------------------
////Signup Request
////Only runs if the entered name, email, and password are valid
    if (isValidUserName(username) && isValidEmail(email) && isValidPassword(password) == 0)
    {
    print("Valid Email & Password will now attempt to 'signup'")
    //sets the value in param
    params2["name"] = username
    params2["email"] = email
    params2["password"] = password

    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url2, method: .post, parameters: params2, encoding: JSONEncoding.default) .responseJSON
    { response in
        print(response.response?.statusCode as Any)
        //Loads into switch
        switch response.result {
        //If succesfully reaches site
        case .success(_):

            //shortens to data
            if let data = response.data
            {
                //shortens to json
                if let json = try? JSON(data: data)
                {
                    //On success prints corresponding values
                    if (response.response?.statusCode == 201)
                    {
                        let message = json["message"].rawString() ?? ""
                        completion(message)
                    }
                    else
                    {
                        //prints string attached to message such as user already exists
                        let message = json["error"]["detail"].rawString() ?? ""
                        completion(message)
                    }
                }
            }
            break
        case .failure(_):
            print("INVALID URL")
            break
        }
    }
    }
}
