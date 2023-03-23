

import UIKit

class StopwatchViewController: UIViewController {

    @IBOutlet weak var TimerLable: UILabel!
    var dateFormatter = DateFormatter()
    var timer : Timer?
    var dateAtstart: Date?
    var elapsedAtStop: TimeInterval = 0
    
    @objc func UpdateElapsedTime() {
        TimerLable.text = dateFormatter.string(from: dateTimeFormatter() as Date )
    }
    
    private func dateTimeFormatter() -> Date{
        if dateAtstart != nil {
            let TimeInterval = Date().timeIntervalSince(dateAtstart!)
            let totaElapsedTimes = elapsedAtStop + TimeInterval
            return Date(timeIntervalSince1970: totaElapsedTimes)
        }
        return Date(timeIntervalSince1970: elapsedAtStop)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "mm:ss:SS"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        UpdateElapsedTime()
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        if dateAtstart == nil {
            dateAtstart = Date()
            timer = Timer.scheduledTimer(timeInterval: 1.0/99.0, target: self, selector: #selector(UpdateElapsedTime), userInfo: nil, repeats: true)
        }
    }
    @IBAction func stopResetButton(_ sender: Any) {
        if let dateStart = dateAtstart {
            elapsedAtStop = elapsedAtStop + Date().timeIntervalSince(dateStart as Date)
        } else {
            elapsedAtStop = 0
        }
        
        timer?.invalidate()
        timer = nil
        dateAtstart = nil
        UpdateElapsedTime()
    }
    
}
