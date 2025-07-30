//
//  toDo.swift
//  Connext
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct toDo: View {
    @State private var userToDo: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.beige)
                    .ignoresSafeArea()
                Text(userToDo)
                VStack {
                    HStack {
                        Text("To-Do's")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                        Spacer()
                    }//HStack Closing
                   Spacer()
                    HStack{
                        Text("Add your To-Do")
                            .padding()
                            .font(.title3)
                            .fontWeight(.bold)
                        TextField("Type here", text: $userToDo)
                            .font(.title3)
                    }
                
                    
                }
                

            }//ZStack closing
            customToolbar()
        }
    }
}

#Preview {
    toDo()
}
