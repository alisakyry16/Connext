//
// createProject.swift
// Connext
//
// Created by Scholar on 7/29/25.
//
import SwiftUI
struct createProject: View {
  @State private var name = ""
  @State private var projectName = ""
  @State private var topic = "None"
  @State private var details = ""
  @State private var location = ""
  @State private var listing = "Private"
  let topics = ["None", "Tech", "Art", "Science", "Social"]
  let listings = ["Private", "Public"]
  var backgroundColor: Color {
    Color(red: 248/255, green: 245/255, blue: 242/255) // #F8F5F2
  }
  var body: some View {
    ZStack {
      backgroundColor
        .ignoresSafeArea()
      VStack(alignment: .leading, spacing: 20) {
        Text("Start a Project")
          .font(.system(size: 24, weight: .bold))
          .padding(.vertical, 10)
        Group {
          LabelledTextField(label: "NAME", text: $name)
          LabelledTextField(label: "PROJECT NAME", text: $projectName)
          Text("TOPIC")
            .font(.system(size: 14, weight: .bold))
          Picker(selection: $topic, label: HStack {
            Text(topic)
            Spacer()
            Image(systemName: "chevron.down")
          }
            .foregroundColor(.black)
            .padding()
            .background(fieldColor)
            .cornerRadius(20)
          ) {
            ForEach(topics, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(MenuPickerStyle())
          Text("DETAILS")
            .font(.system(size: 14, weight: .bold))
          TextEditor(text: $details)
            .frame(height: 100)
            .padding()
            .background(fieldColor)
            .cornerRadius(20)
          LabelledTextField(label: "LOCATION", text: $location)
          Text("LISTING")
            .font(.system(size: 14, weight: .bold))
          Picker(selection: $listing, label: HStack {
            Text(listing)
            Spacer()
            Image(systemName: "chevron.down")
          }
            .foregroundColor(.black)
            .padding()
            .background(fieldColor)
            .cornerRadius(20)
          ) {
            ForEach(listings, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(MenuPickerStyle())
        }
        Spacer()
        Button(action: {
        }) {
          Text("Done")
            .fontWeight(.bold)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.all)
            .background(fieldColor)
            .cornerRadius(30)
        }
      }
      .padding()
    }
    var fieldColor: Color {
      Color(red: 173/255, green: 179/255, blue: 217/255) // matches your UI's bluish fill
    }
  }
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
  createProject()
}










