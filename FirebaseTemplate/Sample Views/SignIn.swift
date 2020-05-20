//
//  SignIn.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    @State var credentials = SignInCredentials(email: "", password: "")
    @State var signedIn = false  // if true will show aler success , if false wil show alert failed
    @State var okAndCancel = false  // to show alert after click sign in , seccess or failed
    @State var moveToMain = false
    var body: some View {
            VStack{
                NavigationLink(destination: newViewTemp(), isActive: $moveToMain){
                              Text("") }
                TextField("Email", text: $credentials.email)
                    .padding()
                SecureField("Password", text: $credentials.password)
                    .padding()
                Button("Sign In", action: signIn)
                }.navigationBarTitle("Sign In")
        .alert(isPresented: $okAndCancel, content: signInAndfailed)
    }
    
    func signIn(){
        Networking.signIn(user: credentials, collectionName: "users", success: { str in
            // successfully signed in
            self.okAndCancel = true
             self.signedIn = true
        })
        {
            // fail
            self.okAndCancel = true
            self.signedIn = false
        }
    }

    func signInAndfailed() -> Alert{
        if self.signedIn {
      return Alert(title: Text("Signed In Successfully"), message: Text("You have signed in successfully with email \(self.credentials.email)."), dismissButton: .default(Text("Done")){
      self.moveToMain = true
      })
        }
        return Alert(title: Text("Error!"), message: Text("Couldn't sign in with email \(self.credentials.email)."), dismissButton: .default(Text("Done")))
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
