//
//  UserProfileView.swift
//  FitFriends
//
//  Created by Matthew O'Meara on 4/13/21.
//

import SwiftUI

//will eventually show user details 
struct UserProfileView: View {
    var body: some View {
        NavigationView {
            Text(name)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
