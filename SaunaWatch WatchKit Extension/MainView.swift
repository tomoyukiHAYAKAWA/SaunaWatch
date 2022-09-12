import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 0.5)
                .stroke(Color.blue,
                        style: StrokeStyle(
                            lineWidth: 20,
                            lineCap: .round)
                )
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: 270))
            VStack(spacing: 8) {
                Text("110 BPM")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                Text("06:00")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
