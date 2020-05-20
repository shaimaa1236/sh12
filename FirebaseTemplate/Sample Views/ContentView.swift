//
//  ContentView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var moveToSigUp = false
    var body: some View {
        NavigationView{
        VStack{
          NavigationLink(destination: SignUp(), isActive: $moveToSigUp){
                                                          Text("") }
            SignIn()
         
            Button(action: {
                self.moveToSigUp = true
            }){
 Text("Sign Up")
            }
            
              
                        
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
