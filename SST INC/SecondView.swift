import SwiftUI
import MapKit

struct SecondView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    AppButton(appName: "SearchINC", destination: SearchINCView(), color: .red)
                    AppButton(appName: "INCpass", destination: INCpassView(), color: .green)
                }
                
                HStack {
                    AppButton(appName: "INChat", destination: INChatView(), color: .blue)
                    AppButton(appName: "ShoppINC", destination: ShoppINCView(), color: .orange)
                }
                
                HStack {
                    AppButton(appName: "INCamera", destination: INCameraView(), color: .purple)
                    AppButton(appName: "TrackINC", destination: TrackINCView(), color: .pink)
                }

                // New button to navigate to the InputView
                AppButton(appName: "Input Evidence", destination: InputView(), color: .yellow)
            }
            .navigationTitle("Home Screen")
        }
    }
}

// AppButton struct for navigation buttons
struct AppButton<Destination: View>: View {
    var appName: String
    var destination: Destination
    var color: Color
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(appName)
                .frame(width: 100, height: 100)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding()
        }
    }
}

// New Input View for user to fill in answers
struct InputView: View {
    @State private var answers: [String] = ["", "", "", "", ""]
    let correctAnswers = ["Short Ted", "World Trade Center", "Pay debts", "World Trade Center", "Break into the vault and take the incoin to the world trade center"] // Placeholder right answers
    @State private var navigateToFinalView = false // State for navigation

    var body: some View {
        VStack {
            Text("Please enter evidence:")
                .font(.headline)
                .padding()
            
            ForEach(0..<1, id: \.self) { index in
                TextField("Who is the accomplice?", text: $answers[index])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            ForEach(1..<2, id: \.self) { index in
                TextField("Where did they flee?", text: $answers[index])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            ForEach(2..<3, id: \.self) { index in
                TextField("Why was the Incoin stolen?", text: $answers[index])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            ForEach(3..<4, id: \.self) { index in
                TextField("Where are they now?", text: $answers[index])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            ForEach(4..<5, id: \.self) { index in
                TextField("How did they steal the Incoin?", text: $answers[index])
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            NavigationLink(
                destination: FinalView(),
                isActive: $navigateToFinalView,
                label: {
                    Button(action: {
                        checkAnswers()
                    }) {
                        Text("Submit")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            )
        }
        .navigationTitle("Input Answers")
    }
    
    private func checkAnswers() {
        if answers == correctAnswers {
            // Navigate to FinalView if all answers are correct
            navigateToFinalView = true
        } else {
            print("Some answers are incorrect!")
        }
    }
}

// Existing views remain unchanged...
struct SearchINCView: View {
    var body: some View {
        VStack {
            Image("Avyan")
            Text("Profile: Tall Avyan")
            Text("SEARCH HISTORY")
                .font(.largeTitle)
            Text("10 OCT 14 52: incoin to SGD")
            Text("14 OCT 18 07: how to make bomb")
            Text("19 OCT 09 22: explosives")
            Text("20 OCT 10 35: cracking safes tutorial")
        }
        .navigationTitle("SearchINC")
    }
}

struct INCpassView: View {
    var body: some View {
        VStack {
            Image("Avyan")
            Text("Name: AVYAN MEHRA TALL")
                .font(.largeTitle)
            Text("F/N No. T1111111A")
            Text("Nationality: Singaporean")
            Text("Job: Farmer")
            Image("Screenshot 2024-10-20 at 3.31.28 PM")
        }
        .navigationTitle("INCpass")
    }
}

// INChat View with conversation mockup
struct INChatView: View {
    @State private var text = ""
    @State private var msg: [Msg] = [
        Msg(text: "Hello Short Ted", whoTexted: 1),
        Msg(text: "Hi Tall Avyan", whoTexted: 0),
        Msg(text: "Ok", whoTexted: 1),
        Msg(text: "So", whoTexted: 1),
        Msg(text: "Tonight", whoTexted: 1),
        Msg(text: "we steal the moon", whoTexted: 1),
        Msg(text: "bruh", whoTexted: 0),
        Msg(text: "jk", whoTexted: 1),
        Msg(text: "Tonight we will infiltrate INCbank and steal 1000000 INCoin", whoTexted: 1),
        Msg(text: "🤑🤑🤑", whoTexted: 0),
        Msg(text: "Yessir 🫡", whoTexted: 0),
        Msg(text: "remember", whoTexted: 1),
        Msg(text: "we still have to pay off our debts", whoTexted: 1),
        Msg(text: "😢", whoTexted: 0),
        Msg(text: "ok", whoTexted: 1),
        Msg(text: "see you there", whoTexted: 1),
        Msg(text: "ok", whoTexted: 0),
        Msg(text: "😔✊", whoTexted: 0),
        Msg(text: "ive sent u photos of the plan", whoTexted: 1),
        Msg(text: "break into the vault and take the incoin to the world trade center", whoTexted: 1),
        Msg(text: "🫡", whoTexted: 0),
        Msg(text: "make sure to go after 11.30 p.m. and move fast. get the incoin before the guards see you. In each box there should be 100000 incoin, take 10 of those for 1000 000.", whoTexted: 1),
        Msg(text: "got it!", whoTexted: 0)
    ]
    
    var body: some View {
        VStack {
            List {
                ForEach(msg) { item in
                    HStack {
                        if item.whoTexted == 0 {
                            Text(item.text)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .foregroundColor(.black)
                            Spacer()
                        } else {
                            Spacer()
                            Text(item.text)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .background(Color.teal)
            
            HStack {
                TextField("Type a message", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                
                Button {
                    if !text.isEmpty { // Prevent adding empty messages
                        msg.append(Msg(text: text, whoTexted: 1))
                        text = ""
                    }
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.green))
                        .padding()
                }
            }
            .padding()
        }
        .navigationTitle("INChat")
    }
}

struct Msg: Identifiable {
    var text: String
    var whoTexted: Int
    var id: UUID = UUID()
}

struct ShoppINCView: View {
    var body: some View {
        VStack {
            Text("Cart:")
                .font(.largeTitle)
            Text("Delivered")
            Text("Heavy Duty Crowbar")
            Text("$5.70")
        }
        .navigationTitle("ShoppINC")
    }
}

struct INCameraView: View {
    var body: some View {
        VStack {
            Text("Gallery")
                .font(.largeTitle)
            Image("WhatsApp Image 2024-10-20 at 14.18.40")
            Text("Photo of vault entrance")
        }
        .navigationTitle("INCamera")
    }
}

struct TrackINCView: View {
    var body: some View {
        VStack {
            Text("Air Tag: Tall Avyan")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
                .background(Color.white.opacity(0.8)) // Semi-transparent background
                .cornerRadius(10)
                .padding(.top) // Add some space from the top

            // Map Section
            MapView()
                .edgesIgnoringSafeArea(.all) // Make the map full screen

            // Optional World Trade Center Annotation below the map
            Text("World Trade Center")
                .font(.headline)
                .padding(8)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
                .padding(.bottom) // Add some space at the bottom
        }
        .navigationTitle("TrackINC")
    }
}

// MapView to handle the actual map rendering
struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.712743, longitude: -74.013379),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    
    let wtcLocation = Location(coordinate: CLLocationCoordinate2D(latitude: 40.712743, longitude: -74.013379)) // World Trade Center

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [wtcLocation]) { location in
            MapPin(coordinate: location.coordinate, tint: .red) // Marker for World Trade Center
        }
    }
}

// Location struct for annotations
struct Location: Identifiable {
    let id = UUID() // Unique identifier
    let coordinate: CLLocationCoordinate2D
}

// Preview Provider
struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
