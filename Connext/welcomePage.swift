//
//  welcomePage.swift
//  Connext
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

struct welcomePage: View {
    var body: some View {
        //NavigationStack{
            ZStack {
                Color("Red").ignoresSafeArea()

                VStack {
                    HStack {
                        Text("Welcome to Connext!")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .padding()
                        Spacer()
                        
                    }//HStack
                    Spacer()
                    //insert buttons
                    NavigationStack {
                        VStack {
                            HStack {
                                NavigationLink(destination: createProject(project: ProjectViewModel())) {
                                    Image("createProject")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                }

                                NavigationLink(destination: createProject(project: ProjectViewModel())) {
                                    Image("joinProject")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                }
                            }
                        }
                    }
                }
            }
       // }
        
    }
}

#Preview {
    welcomePage()
}
