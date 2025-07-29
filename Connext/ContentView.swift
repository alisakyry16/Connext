//
//  ContentView.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Project Name")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button("+") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .font(.largeTitle)
                }
                HStack {
                    Text("Edit Details")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("Create Project")
                        .font(.headline)
                        .fontWeight(.semibold)
                }
                Spacer()
                HStack {
                    Text("Next Steps")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                Text("Task 1")
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Rectangle().foregroundColor(.purple))
                    .cornerRadius(20)
                    .padding(3.0)
                Text("Task 2")
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Rectangle().foregroundColor(.purple))
                    .cornerRadius(20)
                    .padding(3.0)
                Text("Task 3")
                    .font(.title2)
                    .fontWeight(.medium)
                    .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Rectangle().foregroundColor(.purple))
                    .cornerRadius(20)
                    .padding(3.0)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
