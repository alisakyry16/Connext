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
            ZStack {
                Color(.beige)
                    .ignoresSafeArea()
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
                        .foregroundColor(.lightBlue)
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
                    ProgressRing(progress: 0.6)
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
                        .foregroundColor(.white)
                        .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        .background(Rectangle().foregroundColor(.darkBlue))
                        .cornerRadius(20)
                        .padding(3.0)
                    Text("Task 2")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 350, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                        .background(Rectangle().foregroundColor(.darkBlue))
                        .cornerRadius(20)
                        .padding(3.0)
                    Text("Task 3")
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
        }
    }
}

struct ProgressRing: View {
    var progress: CGFloat  // between 0.0 and 1.0
    var lineWidth: CGFloat = 20
    var size: CGFloat = 200

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: lineWidth)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))

            Text("\(Int(progress * 100))%")
                .font(.caption2)
                .foregroundColor(.black)
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    ContentView()
}
