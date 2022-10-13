import Foundation
import SwiftUI
import Combine

final class MainViewModel: ObservableObject {

    @Published var timerString: String = "00:00"
    @Published var isProgression: Bool = true
    @Published var progression12Value: CGFloat = 0.0
    @Published var progressionValue: CGFloat = 0.0
    private var timer12Count: CGFloat = 0.0
    private var timerCount: CGFloat = 0.0
    private var cancellable: AnyCancellable?

    init() {
        startTimer()
    }

    /// サークルの進行を開始・停止する
    func tappedStartButton() {
        isProgression ? cancellable?.cancel() : startTimer()
        isProgression.toggle()
    }

    /// サークルの進行をリセットする
    func tappedRepeatButton() {
        timer12Count = 0
        timerCount = 0
        progression12Value = 0.0
        progressionValue = 0.0
        timerString = "0"
    }

    // MARK: - Private

    private func startTimer() {
        cancellable = Timer.publish(every: 0.01, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.countUp12Minutes()
                self?.countUpMinute()
            }
    }

    private func countUp12Minutes() {
        if timer12Count >= 720 { timer12Count = 0 }
        timer12Count = timer12Count + 0.01
        // 円を進める値
        progression12Value = timer12Count / 720.0
        // 0フォーマット
        let m = (Int(timer12Count) % 3600) / 60
        // 経過時間
        timerString = String(String(format: "%d", m))
    }

    private func countUpMinute() {
        if timerCount >= 60 { timerCount = 0 }
        timerCount = timerCount + 0.01
        progressionValue = timerCount / 60.0
    }
}
