import Foundation
import SwiftUI
import Combine

final class MainViewModel: ObservableObject {

    @Published var timerString: String = "00:00"
    @Published var isProgression: Bool = true
    @Published var progressionValue: CGFloat = 0.0
    private var timerCount: Int = 0
    private var cancellable: AnyCancellable?

    init() {
        cancellable = Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.countUp()
            }
    }

    /// サークルの進行を開始・停止する
    func tappedStartButton() {
        isProgression.toggle()
    }

    /// サークルの進行をリセットする
    func tappedRepeatButton() {
    }

    // MARK: - Private
    private func countUp() {
        if timerCount > 720 { timerCount = 0 }
        timerCount = timerCount + 1
        progressionValue = CGFloat(timerCount) / 720.0
        // 00:00のフォーマットで表示する
        let m = (timerCount % 3600) / 60
        let s = (timerCount % 60)
        timerString = String(String(format: "%02d:%02d", m, s))
    }
}