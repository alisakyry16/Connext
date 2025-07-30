//
// createProject.swift
// Connext
//
// Created by Scholar on 7/29/25.
//
import SwiftUI

struct createProject: View {
    @ObservedObject var project: ProjectViewModel
    @Environment(\.presentationMode) var presentationMode
//    @State private var name = ""
//    @State private var projectName = ""
//    @State private var topic = "None"
//    @State private var details = ""
//    @State private var location = ""
//    @State private var listing = "Private"

    let topics = ["None", "Tech", "Art", "Science", "Social"]
    let listings = ["Private", "Public"]

    var backgroundColor: Color {
        Color(red: 248/255, green: 245/255, blue: 242/255) // #F8F5F2
    }

    var fieldColor: Color {
        Color(red: 185/255, green: 190/255, blue: 225/255) // slightly lighter bluish fill
    }
    var doneColor: Color {
        Color(red: 173/255, green: 179/255, blue: 217/255) // slightly lighter bluish fill
    }



    var body: some View {
        ZStack {
            backgroundColor.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                Text("Start a Project")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.top, 20)

                Group {
                    LabelledTextField(label: "NAME", text: $project.name)
                    LabelledTextField(label: "PROJECT NAME", text: $project.projectName)

                    Text("TOPIC")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)

                    Menu {
                        ForEach(topics, id: \.self) { option in
                            Button(action: {
                                project.topic = option
                            }) {
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    } label: {
                        HStack {
                            Text(project.topic)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                        .padding(10)
                        .background(fieldColor)
                        .cornerRadius(20)
                    }

                    Text("DETAILS")
                        .font(.system(size: 14, weight: .bold))

                    TextEditor(text: $project.details)
                        .frame(height: 100)
                        .padding()
                        .background(fieldColor)
                        .cornerRadius(20)

                    LabelledTextField(label: "LOCATION", text: $project.location)

                    Text("LISTING")
                        .font(.system(size: 14, weight: .bold))

                    Menu {
                        ForEach(listings, id: \.self) { option in
                            Button(action: {
                                project.listing = option
                            }) {
                                Text(option)
                                    .foregroundColor(.black)
                            }
                        }
                    } label: {
                        HStack {
                            Text(project.listing)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                        .padding(10)
                        .background(fieldColor)
                        .cornerRadius(20)
                    }
                }
                Spacer()
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(doneColor)
                .cornerRadius(30)
                .foregroundColor(.black)
                .fontWeight(.semibold)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }

    // Inner text field view
    struct LabelledTextField: View {
        var label: String
        @Binding var text: String

        var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                Text(label)
                    .font(.system(size: 14, weight: .bold))

                TextField("", text: $text)
                    .padding()
                    .background(Color(red: 173/255, green: 179/255, blue: 217/255))
                    .cornerRadius(20)
            }
        }
    }
}
#Preview {
    createProject(project: ProjectViewModel())
}










