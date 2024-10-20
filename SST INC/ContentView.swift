import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                
                Text("🚨 Massive Heist of Incoin! 🚨")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                
                Text("We need your help to find the culprit.")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Text("Forensics have found a phone belonging to the perpetrator left at the scene.")
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("We have sent you the phone in question in hopes that you can uncover the culprit's identity, where they fled, their motive, location, and how they did it.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: SecondView()) {
                    Text("🔍 Accept the Challenge")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                }
                
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6).ignoresSafeArea())
            .navigationTitle("Incoin Heist")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
