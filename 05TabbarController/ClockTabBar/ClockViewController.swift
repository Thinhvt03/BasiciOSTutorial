//

import UIKit

class ClockViewController: UIViewController {

    @IBOutlet weak var clockLable: UILabel!
    var dateFormstter = DateFormatter()
    var timer : Timer?
    
    // UpdateTime
    @objc func UpdateTime () {
        clockLable.text = dateFormstter.string(from: Date()) 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateTime()
        dateFormstter.dateFormat = "hh:mm:ss"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
    }
    
}

