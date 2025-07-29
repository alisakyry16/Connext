//
//  ContentView.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI
struct ProgressRing: View {
    var progress: CGFloat  // between 0.0 and 1.0
    var lineWidth: CGFloat = 45
    var size: CGFloat = 200

var body: some View {
    ZStack {
        Circle()
            .stroke(Color.lightBlue.opacity(0.3), lineWidth: lineWidth)

        Circle()
            .trim(from: 0.0, to: progress)
            .stroke(Color.darkBlue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .rotationEffect(.degrees(-90))

        Text("\(Int(progress * 100))%")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black)
       }
       .frame(width: size, height: size)
   }
}
struct ContentView: View {
    @State private var task1 = ""
    @State private var task2 = ""
    @State private var task3 = ""
    @State private var projectName = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.beige)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Project Name")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        NavigationLink(destination: createProject()){
                            Text("+")
                            .font(.largeTitle)
                            .foregroundColor(.lightBlue)
                            .fontWeight(.semibold)
                        }
                    }
                    HStack {
                        Button("Edit Details") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.lightBlue)
                        Spacer()
                    }
                    Spacer()
                    ProgressRing(progress: 0.1)
                    Spacer()
                    HStack {
                        Text("Next Steps")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    Text(task1)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        .background(Rectangle().foregroundColor(.darkBlue))
                        .cornerRadius(20)
                        .padding(3.0)
                    Text(task2)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        .background(Rectangle().foregroundColor(.darkBlue))
                        .cornerRadius(20)
                        .padding(3.0)
                    Text(task3)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        .background(Rectangle().foregroundColor(.darkBlue))
                        .cornerRadius(20)
                        .padding(3.0)
                }
                .padding()
                
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    ContentView()
}
