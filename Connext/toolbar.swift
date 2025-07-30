//
//  toolbar.swift
//  Connext
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct customToolbar: View {
    var body: some View {
        Spacer()
        
        VStack(spacing: 0) {
            HStack {
                Spacer()
                NavigationLink(destination: toDo(projectID: UUID())){
                    Image("checkboxIcon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(y: 14)
                }
                Spacer()
                NavigationLink(destination: ContentView(project: ProjectViewModel())) {
              
                    Image("houseIcon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(y: 14)
                }
                Spacer()
                NavigationLink(destination: joinProject()) {
                    Image("joinProjectIcon")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(y: 15)
                }
                Spacer()
            }
            .frame(height: 40)
            //.padding()
            .background(Color.lightBlue.opacity(0.9))
            .shadow(radius: 5)
        }
    }
}

#Preview {
    customToolbar()
}
