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
        
        } // ZStack closing
        customToolbar()
    } // body closing
} // struct closing

#Preview {
    joinProject()
}
