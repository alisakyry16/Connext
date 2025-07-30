//
//  toDo.swift
//  Connext
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct toDo: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.beige)
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("To-Do's")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                        Spacer()
                    }
                   Spacer()
                }

            }
            customToolbar()
        }
    }
}

#Preview {
    toDo()
}
