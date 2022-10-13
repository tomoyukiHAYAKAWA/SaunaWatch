import SwiftUI

struct SmallCircleView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 1.0)
            .stroke(Color.white,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round)
            )
            .opacity(0.5)
            .frame(width: 120, height: 120)
            .rotationEffect(Angle(degrees: 270))
        Circle()
            .trim(from: 0.0, to: viewModel.progressionValue)
            .stroke(Color.white,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round)
            )
            .frame(width: 120, height: 120)
            .rotationEffect(Angle(degrees: 270))
    }
}

struct SmallCircleView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCircleView().environmentObject(MainViewModel())
    }
}
