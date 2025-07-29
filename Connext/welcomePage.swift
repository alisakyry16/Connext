import SwiftUI
struct WelcomePage: View {
  @ObservedObject var project: ProjectViewModel
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    NavigationStack {
      ZStack {
        Color(.beige)
          .ignoresSafeArea()
        VStack {
          HStack {
            Text("Welcome to Connext!")
              .font(.title)
              .fontWeight(.bold)
              .padding()
            Spacer()
          }
          Spacer()
          // BUTTONS (use shared project instance!)
          HStack {
            NavigationLink(destination: createProject(project: project)) {
              Image("createProject")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(maxWidth: .infinity)
            }
            NavigationLink(destination: joinProject()) {
              Image("joinProject")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .frame(maxWidth: .infinity)
            }
          }
          Spacer()
        }
        .padding()
      }
    }
  }
}
#Preview {
  WelcomePage(project: ProjectViewModel())
}
