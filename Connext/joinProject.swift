//
//  joinProject.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

struct joinProject: View {
    @State private var name = "Alaina Patel"
    @State private var projectName = "myProject"
    
    var body: some View {
        ZStack {
            Color(.beige)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("Join a Project")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .padding()
                    
                    Spacer()
                }
                
                Image("listingBackround")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(maxWidth: .infinity)
                
                Spacer()
            } // VStack closing
            
            Image("toolbar")
                .resizable()
                .ignoresSafeArea()
                .padding(.top, 0.0)

            VStack {
                NavigationLink(destination: ContentView(project: ProjectViewModel())) {
                    Image("houseIcon")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: 50, height: 38)
                        .padding(.top, 730.0)
                }
            }
        } // ZStack closing
    } // body closing
} // struct closing

#Preview {
    joinProject()
}
