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
                    BigCircleView().environmentObject(viewModel)
                    SmallCircleView().environmentObject(viewModel)
                    VStack(spacing: 8) {
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
