import SwiftUI

struct FinalView: View {
    var body: some View {
        VStack {
            Text("🎉 You have found the criminals!! 🎉")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding()
            
            Text("Congratulations!")
                .font(.title)
                .foregroundColor(.blue)
                .padding(.bottom, 20)
            
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.yellow.opacity(0.3)) // Soft background color
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

#Preview {
    FinalView()
}
