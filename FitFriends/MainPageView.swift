//
//  ContentView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 3/16/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON
import Foundation


var token = ""
var name = ""
var rmodel = 0
var model = ""
var exList = ""
var calList = ""
var goal = ""
var sheight = ""
var sweight = ""
var sgender = ""

struct MainPageView: View {
    var body: some View {
            Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}

struct Home : View {
    @State var show = false;
    init(){
        UINavigationBar.setAnimationsEnabled(false)
    }
    var body: some View {
        NavigationView {
            ZStack {
              NavigationLink(
                destination: RegistrationPageView(show: self.$show)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                ,
                isActive: self.$show){
                    Text("")
                }
                Login(show: self.$show)
            }
        }
    }
}


struct Login : View {
    @State var color = Color.black.opacity(0.5)
    @State var user = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var isLoggedIn = false
    @State var alert = false
    @State var error = ""
    @State var loading = false
    //@State var name = ""
    let myGroup = DispatchGroup()

    var body :some View{
        ZStack {
            //background Color
            LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color2"),Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            NavigationLink(destination: UserPageView(), isActive: $isLoggedIn){
                
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            VStack {
            //FitFriends logo
                Image("Logo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/2, height:UIScreen.main.bounds.height/4.5)
                    .padding(.top,-(UIScreen.main.bounds.width/5))
                
                //horizontal stack holding existing and new buttons
                HStack{
                    
                    //existing button
                    Button(action: {
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
                        self.show.toggle()
                        
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
                
                VStack{
                    //vertical stack holding all inputs
                    VStack{
                        //horizontal stack holding email address
                        HStack(spacing: 15){
                            Image(systemName: "envelope")
                                .resizable()
                                .frame(width:16, height: 13)
                                .foregroundColor(.black)
                            TextField("Email Address", text: self.$user).autocapitalization(.none)
                        }.padding(.vertical, 20)
                        
                        Divider().background(Color("Color"))
                        
                        //horizontal stack holding password
                        HStack(spacing: 15){
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width:15, height:18)
                                .foregroundColor(.black)
                            if self.visible{
                                TextField("Password", text: self.$pass).autocapitalization(.none)
                            } else {
                                SecureField("Password", text: self.$pass)
                            }
                            
                            Button(action: {
                                self.visible.toggle()
                            }) {
                                Image(systemName: self.visible ? "eye" : "eye.slash")
                                    .foregroundColor(.black)
                            }
                        }.padding(.vertical, 20)
                        
                        Divider().background(Color("Color"))
                    }
                    //add padding around vertical stack holding email and password
                    .padding(.vertical)
                    .padding(.horizontal,20)
                    .padding(.bottom,40)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.top,25)
                    
//========================================================
                    //button for login
                    Button(action: {
                        checkInputs()
                        myGroup.enter()
                        tryLogin(self.user, self.pass) { response in
                             // Do your stuff here
                            //self.token = "Bearer " + response
                            let dict = response
                            token = dict["token"]!
                            name = dict["name"]!
                            model = dict["role_model"]!
                            sheight = dict["height"] ?? ""
                            sweight = dict["weight"] ?? ""
                            sgender = dict["gender"] ?? ""
                             myGroup.leave()
                         }
                         
                        // Waits for request to finish
                        myGroup.notify(queue: .main) {
                            //if successfull, toggle loading, wait 2 seconds and direct to user page
                            if token != "error"{
                                token = "Bearer " + token
                                print("model " + model)
                                
                                if(model == "Advanced")
                                {
                                    rmodel = 3
                                }
                                else if(model == "Intermediate")
                                {
                                    rmodel = 2
                                }
                                else if(model == "Beginner")
                                {
                                    rmodel = 1
                                }
                                else
                                {
                                    rmodel = 0
                                }
                                
                                print(token)
                                let entryGroup = DispatchGroup()
                                var message = ""
                                entryGroup.enter()
                                callNewEntry(token){ response in
                                    // Do your stuff here
                                   //self.token = "Bearer " + response
                                    let dict = response
                                    message = dict["error"]!
                                    exList = dict["exercise"] ?? ""
                                    calList = dict["calories"] ?? ""
                                    goal = dict["goal"] ?? ""
                                    entryGroup.leave()
                                }
                                entryGroup.notify(queue: .main){
                                    if(message != "error")
                                    {
                                        
                                        print("EXLIST " + calList)
                                        print("NEW ENTRY ADDED")
                                    }
                                    else{
                                        print("Error occured")
                                    }
                                }
                                
                                withAnimation {
                                    self.loading.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        self.isLoggedIn.toggle()
                                    }
                                }
                            } else {
                                self.error = "Email or password is incorrect."
                                self.alert.toggle()
                            }
                         }
//==============================================
                    }){
                        Text("LOGIN")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width / 1.5)
                    }.background(Color.init("Color"))
                    .cornerRadius(5)
                    .offset(y: -40)
                    .padding(.bottom,-40)
                    
    
        
                }
                .edgesIgnoringSafeArea(.all)
            }
            .padding()
            if self.alert{
                ViewError(alert: self.$alert, error: self.$error)
            }
            if loading {
                LoadView(placeHolder: "Logging in..", show: $loading)
            }
            
        }
        
    }
    
    func checkInputs(){
        if self.user != "" &&  self.pass != "" {
            if (!isValidEmail(self.user)){
                self.error = "Not a valid email address."
                self.alert.toggle()
            }
        } else {
            self.error = "Please fill in all blanks in order to register."
            self.alert.toggle()
        }
    }

}


struct ViewError : View {
    @Binding var alert : Bool
    @Binding var error : String

    var body: some View {
        VStack{
            VStack {
                HStack(){
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)

                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal)

                Text(self.error)
                    .foregroundColor(.black)
                    .padding(.top)
                    .padding(.horizontal)
                    .fixedSize(horizontal: false, vertical: true)
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width / 1.8)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top)
                .padding(.bottom)

            }
            .padding(.vertical,25)
            .frame(width: UIScreen.main.bounds.width / 1.25,height: UIScreen.main.bounds.height / 3.25)
            .background(Color.white)
            .cornerRadius(15)
            

        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
    }
}

struct LoadView : View {
    var placeHolder : String
    @Binding var show : Bool
    @State var animate = false
    var body : some View {

        VStack(spacing: 28) {
            Circle()
                .stroke(AngularGradient(gradient:.init(colors: [Color("Color"),Color("Color2"),Color("Color3")]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                .rotationEffect(.init(degrees: animate ? 360 : 0))
            Text(placeHolder)
                .fontWeight(.bold)

        }
        .padding(.vertical,UIScreen.main.bounds.width/8)
        .padding(.horizontal,UIScreen.main.bounds.width/8)
        .background(BlurView())
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.5).onTapGesture {
                withAnimation{
                    show.toggle()
                }
            }.edgesIgnoringSafeArea(.all)
        )
        .onAppear{
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
                animate.toggle()
            }

        }
    }
}

struct BlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {

    }
}

func isValidUserName(_ name: String) -> Bool {
    if (name.count <= 21)
    {
        return true
    }
    return false
}

//Check if email is in right format
func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

//Check if password is in right format
func isValidPassword(_ password: String) -> Int {
    
    //Password is of valid length
    if (password.count >= 6 && password.count < 21)
    {
        //Checks if there is a capital letter
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        guard texttest.evaluate(with: password) else
        {
            return 2
        }
        //Checks if there is a lowercase letter
        let lowerLetterRegEx  = ".*[a-z]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
        guard texttest2.evaluate(with: password) else
        {
            return 2
        }
        //Checks if there is a number
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        guard texttest1.evaluate(with: password) else
        {
            return 2
        }

        return 0
    }
    else
    {
        return 1
    }
}

func tryLogin(_ email: String, _ password: String,_ completion: @escaping ([String:String]) -> Void){
    //---------------------------------------------------------------------------
    //Login Request
    //Only runs if the entered email and password are valid
    let url = "https://fit-friends.herokuapp.com/api/user/login"
    //Parameters to input
    var params = ["email": "", "password": ""]

    var token = ""
    var name = ""
    
    var dict = ["token": "", "name": "", "role_model": "", "height": "", "weight": "", "gender": ""]
    
    if ( isValidEmail(email) && isValidPassword(password) == 0)
    {
        print("Valid Email & Password will now attempt to 'login'")
    
        //sets the value in param
        params["email"] = email
        params["password"] = password
    
        //Requests at (fitfriends, POST, data to go in, JSON format)
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default) .responseJSON
        { response in
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
                            //If it reaches this point the user is succesfully logged in
                            //You probably won't need this but its usefull to see if everything is working as it prints in the console
                            //print(json["message"])
                            //IMPORTANT identifies user for later use
                            //token = json["Token"].rawString() ?? ""
                            token = json["Token"].string ?? ""
                            name = json["data"]["name"].string ?? ""
                            let model = json["data"]["role_model"].string ?? ""
                            let h = json["data"]["height"].string ?? ""
                            let w = json["data"]["weight"].string ?? ""
                            let g = json["data"]["gender"].string ?? ""
                            dict["token"] = token
                            dict["name"] = name
                            dict["role_model"] = model
                            dict["height"] = h
                            dict["weight"] = w
                            dict["gender"] = g
                            completion(dict)
                            //You can send them to the user page at this point
                        }
                        else
                        {
                            token = "error"
                            dict["token"] = token
                            completion(dict)
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
