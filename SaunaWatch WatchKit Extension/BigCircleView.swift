import SwiftUI

struct BigCircleView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 1.0)
            .stroke(Color.white,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round)
            )
            .opacity(0.5)
            .frame(width: 150, height: 150)
            .rotationEffect(Angle(degrees: 270))
        Circle()
            .trim(from: 0.0, to: viewModel.progression12Value)
            .stroke(Color.white,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round)
            )
            .frame(width: 150, height: 150)
            .rotationEffect(Angle(degrees: 270))
    }
}

struct BigCircleView_Previews: PreviewProvider {
    static var previews: some View {
        BigCircleView().environmentObject(MainViewModel())
    }
}
