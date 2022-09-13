import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        viewModel.tappedStartButton()
                    }) {
                        viewModel.isProgression ? Image(systemName: "stop.fill") : Image(systemName: "play.fill")
                    }
                    .frame(width: 25, height: 25)
                    Spacer()
                    Button(action: {
                        viewModel.tappedRepeatButton()
                    }) {
                        Image(systemName: "repeat")
                    }
                    .frame(width: 25, height: 25)
                }
                ZStack {
                    Circle()
                        .trim(from: 0.0, to: 1.0)
                        .stroke(Color.white,
                                style: StrokeStyle(
                                    lineWidth: 20,
                                    lineCap: .round)
                        )
                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: 270))
                    Circle()
                        .trim(from: 0.0, to: viewModel.progressionValue)
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(
                                    colors: [.blue, .red]),
                                    center: .center
                            ),
                                style: StrokeStyle(
                                    lineWidth: 20,
                                    lineCap: .butt)
                        )
                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: 270))
                    VStack(spacing: 8) {
                        Text("110 BPM")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        Text(viewModel.timerString)
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(MainViewModel())
    }
}
