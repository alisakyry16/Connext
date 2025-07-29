import SwiftUI

struct WelcomePage: View {
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
    
                    }

                
                    HStack {
                        NavigationLink(destination: createProject()) {
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
                }
                .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    WelcomePage()
}
