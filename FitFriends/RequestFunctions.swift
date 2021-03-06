//
//  RequestFunctions.swift
//  FitFriends
//
//  Created by Uday Kalvakota on 4/13/21.
//

import UIKit
import Alamofire
import Foundation
import SwiftyJSON


//the token we got earlier
//let token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwX2lkIjo5LCJpYXQiOjE2MTc4MTU0MDh9.MsM0mphla5by_hWNBYhHZ8xqnlD_567QzrwFEp3BUAg"
//
////Stores the entries from the request
//var dailyInfo = ["date":"", "d_id": "", "calories": "", "exercise": "", "p_fk": "", "error": ""]
//
////stores messages from request
//var message = ""

//====================================================================

//===============EXAMPLE CODE to delete Exercise=========================
//let addGroup3 = DispatchGroup()
//addGroup3.enter()
//removeExercise(token,1){ response in
//    //Saves the response as a dictionary
//    message = response
//
//    addGroup3.leave()
// }

//addGroup3.notify(queue: .main) {
//    //Update some textfield using the dailyInfo
//    if (message != "error")
//    {
//        print(message)
//    }


//===============EXAMPLE CODE to add Exercise=========================
////dispatch group to make sure events occur sequentaly
//let addGroup2 = DispatchGroup()
//addGroup2.enter()
//addNewExercise(token,20, "x", 2, 3){ response in
//    //Saves the response as a dictionary
//    message = response
//
//    addGroup2.leave()
// }
//
//addGroup2.notify(queue: .main) {
//    //Update some textfield using the dailyInfo
//    if (message != "error")
//    {
//        print(message)
//    }
// }


//===============EXAMPLE CODE to add Calories=========================

////dispatch group to make sure events occur sequentaly
//let addGroup = DispatchGroup()
//addGroup.enter()
//addNewCalories(token,20, "a", "b"){ response in
//    //Saves the response as a dictionary
//    message = response
//
//    addGroup.leave()
// }
//
//addGroup.notify(queue: .main) {
//    //Update some textfield using the dailyInfo
//    if (message != "error")
//    {
//        print(message)
//    }
// }


//===============EXAMPLE CODE to view Information=========================
//dispatch group to make sure events occur sequentaly
//let myGroup = DispatchGroup()
//
//myGroup.enter()
//callNewEntry(token) { response in
//    //Saves the response as a dictionary
//    let dict = response
//    dailyInfo["date"] = dict["date"]
//    dailyInfo["d_id"] = dict["d_id"]
//    dailyInfo["calories"] = dict["calories"]
//    dailyInfo["exercise"] = dict["exercise"]
//    myGroup.leave()
// }
//
//// Waits for request to finish
//myGroup.notify(queue: .main) {
//    //Update some textfield using the dailyInfo
//    if (dailyInfo["error"] != "error")
//    {
//        print(dailyInfo["date"]!)
//        print(dailyInfo["d_id"]!)
//        print(dailyInfo["calories"]!)
//        print(dailyInfo["exercise"]!)
//    }
// }

//====================height Model Set=============================

//Sets the height
func setHeight(_ token: String,_ height: String, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/update/height"
    
    //Parameters to input
    var params = ["height": ""]
    params["height"] = height
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}

//Sets the weight
func setWeight(_ token: String,_ weight: String, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/update/weight"
    
    //Parameters to input
    var params = ["weight": ""]
    params["weight"] = weight
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}

//Sets the Role Model
func setGender(_ token: String,_ gender: String, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/update/gender"
    
    //Parameters to input
    var params = ["gender": ""]
    params["gender"] = gender
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}


//====================Role Model Set=============================

//Sets the Role Model
func setRoleModel(_ token: String,_ roleModel: String, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/roleModel"
    
    //Parameters to input
    var params = ["role_model": ""]
    params["role_model"] = roleModel
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
    
    
}

//===========================Add Exercise================================
//Sets the calories for today's date
func addNewExercise(_ token: String,_ amount: Int,_ description: String,_ sets: Int,_ reps: Int, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/info/addExercises"
    
    //Saves the current ddate as a string
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let curDate = formatter.string(from: date)

    //Parameters to input
    var params = ["date": "", "amount": 0, "description": "", "sets": 0, "reps": 0] as [String : Any]
    //sets the current date
    params["date"] = curDate
    params["amount"] = amount
    params["description"] = description
    params["sets"] = sets
    params["reps"] = reps
    
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}


//===========================Add OLD Exercise================================
//Sets the calories for today's date
func addOldExercise(_ token: String,_ date: String, _ amount: Int,_ description: String,_ sets: Int,_ reps: Int, _ completion: @escaping ([String : Any]) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/info/addExercises"

    //Parameters to input
    var params = ["date": "", "amount": 0, "description": "", "sets": 0, "reps": 0] as [String : Any]
    //sets the current date
    params["date"] = date
    var str = amount
    if (str == 0)
    {
        str = 0
    }
    params["amount"] = str
    params["description"] = description
    params["sets"] = sets
    params["reps"] = reps
    
    var retParam = ["message": "error", "e_id": 0] as [String : Any]
    
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
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
                            if (response.response?.statusCode == 200)
                            {
                                retParam["message"] = "Success"
                                retParam["e_id"] = json["e_id"].rawString() ??  ""
                                completion(retParam)
                            }
                            else
                            {
                                completion(retParam);
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


//===========================Remove Exercise================================
//Sets the calories for today's date
func removeExercise(_ token: String,_ id: Int, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/exercises"

    //Parameters to input
    var params = ["e_id": 0]

    params["e_id"] = id
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}

//===========================Remove Calories================================
//Sets the calories for today's date
func removeCalories(_ token: String,_ id: Int, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/calories"

    //Parameters to input
    var params = ["c_id": 0]

    params["c_id"] = id
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .delete, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}

//===========================Add Calories================================
//Sets the calories for today's date
func addNewCalories(_ token: String,_ amount: Int,_ description: String,_ type: String, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/info/addCalories"
    
    //Saves the current ddate as a string
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let curDate = formatter.string(from: date)

    //Parameters to input
    var params = ["date": "", "amount": 0, "description": "", "type": ""] as [String : Any]
    //sets the current date
    params["date"] = curDate
    params["amount"] = amount
    params["description"] = description
    params["type"] = type
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    
                    print(response.response?.statusCode as Any)
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        print("I DID NOT")
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}

//==========================Old Calories=================================
//Add calories to any date in yyyy-mm-dd format
func addOldCalories(_ token: String,_ date: String,_ amount: Int,_ description: String,_ type: String, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/info/addCalories"
    

    //Parameters to input
    var params = ["date": "", "amount": 0, "description": "", "type": ""] as [String : Any]
    //sets the current date
    params["date"] = date
    params["amount"] = amount
    params["description"] = description
    params["type"] = type
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}




//===========================NEW ENTRY===================================
//Calls the info for today's date. Creating a new entry to put information
func callNewEntry(_ token: String,_ completion: @escaping ([String:String]) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/info"
    
    //Saves the current ddate as a string
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    let curDate = formatter.string(from: date)

    //Parameters to input
    var params = ["date": ""]
    //sets the current date
    params["date"] = curDate
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var dict = ["date":"", "d_id": "", "calories": "", "exercise": "", "p_fk" : "", "goal": "",  "error": "error"]
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
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
                       if (response.response?.statusCode == 200)
                       {
                            //Only gets the part of date we need yyyy-mm-dd
                            let sub = json["date_"].rawString() ??  ""
                            let index = sub.firstIndex(of: "T") ?? sub.endIndex
                            let beginning = sub[..<index]
                            let newString = String(beginning)
                        
                            dict["date"] = newString
                            dict["d_id"] = json["d_id"].rawString() ??  ""
                            dict["calories"] = json["calories"].rawString() ??  ""
                            dict["exercise"] = json["exercises"].rawString() ??  ""
                            dict["goal"] = json["calorie_goal"].rawString() ??  ""
                            dict["p_fk"] = json["p_fk"].rawString() ??  ""
                            dict["error"] = "good"
                            completion(dict)
                       }
                       else
                       {
                            completion(dict);
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




//=========================OLD ENTRY======================

//Calls an older entry as long as the date is given in yyyy-mm-dd format
func callOldEntry(_ token: String,_ date: String, _ completion: @escaping ([String:String]) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/info"

    //Parameters to input
    var params = ["date": ""]
    //sets the current date
    params["date"] = date
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var dict = ["date":"", "d_id": "", "calories": "", "exercise": "", "p_fk" : "", "goal": "", "error": "error"]
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
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
                       if (response.response?.statusCode == 200)
                       {
                            //Only gets the part of date we need yyyy-mm-dd
                            let sub = json["date_"].rawString() ??  ""
                            let index = sub.firstIndex(of: "T") ?? sub.endIndex
                            let beginning = sub[..<index]
                            let newString = String(beginning)
                        
                            dict["date"] = newString
                            dict["d_id"] = json["d_id"].rawString() ??  ""
                            dict["calories"] = json["calories"].rawString() ??  ""
                            dict["exercise"] = json["exercises"].rawString() ??  ""
                            dict["goal"] = json["calorie_goal"].rawString() ??  ""
                            dict["error"] = "good"
                            completion(dict)
                       }
                       else
                       {
                            completion(dict);
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

//Turns an String that looks like an array of dictionaries into an array
func textToArray(text: String) -> [String.SubSequence] {
    var text1 = text
    text1 = text1.replacingOccurrences(of: "[\n", with: "", options: .literal, range: nil)
    text1 = text1.replacingOccurrences(of: "]", with: "", options: .literal, range: nil)
    text1 = text1.replacingOccurrences(of: "  {", with: "{", options: .literal, range: nil)
    text1 = text1.replacingOccurrences(of: "  }", with: "}", options: .literal, range: nil)
    text1 = text1.replacingOccurrences(of: "\n", with: "", options: .literal, range: nil)
    text1 = text1.replacingOccurrences(of: "},{", with: "}+{", options: .literal, range: nil)
    let arr = text1.split(separator: "+")
    return arr
}

//Turns a value in the array into a dictionary
func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

//===========================Remove Calories================================
//Sets the calories for today's date
func getCaloriesGoal(_ token: String,_ date: String,_ goal: Int, _ completion: @escaping (String) -> Void)
{
    //URL with endpoint to sent to
    let url = "https://fit-friends.herokuapp.com/api/user/info/update/caloriegoal"

    //Parameters to input
    var params = ["date": "", "calorie_goal": 0] as [String : Any]

    params["date"] = date
    params["calorie_goal"] = goal
    
    //Headers for the request with the token
    let headers: HTTPHeaders = [
        "Content-Type": "application/json",
        "Authorization": token
    ]
    
    //data to grab from request
    var message = "error"
    
    //Requests at (fitfriends, POST, data to go in, JSON format)
    AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers) .responseJSON
    { response in
           //Loads into switch
           switch response.result {
                //If succesfully reaches site
                case .success(_):
                    //On success prints corresponding values
                   if (response.response?.statusCode == 200)
                   {
                        message = "Success"
                    
                        completion(message)
                   }
                   else
                   {
                        completion(message);
                   }
                    break
           case .failure(_):
            print("INVALID URL")
            break
           }
    }
}
