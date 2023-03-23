//////

import UIKit
let ColorPickerNotification = Notification.Name("com.codepath.ColorPickerViewController.didPickColor")
let ColorPickerSelectedColorKey = "com.codepath.ColorPickerViewController.selectedColor"

class ColorPickerViewController: UIViewController {
    
    @IBOutlet weak var colorsSegmentedControl: UISegmentedControl!
    let colors = [("Cyan", UIColor.cyan),  ("Magenta", UIColor.magenta), ("Yellow", UIColor.yellow)]
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsSegmentedControl.removeAllSegments()
        for (index, color) in colors.enumerated() {
            colorsSegmentedControl.insertSegment(withTitle: color.0, at: index, animated: false)
        }
        colorsSegmentedControl.selectedSegmentIndex = 0
    }
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorsSegmentedControl.selectedSegmentIndex
        return colors[selectedIndex].1
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        var selectionInfo : [String: AnyObject] = [ : ]
        if let selectedColor = colorFromSelection() {
            selectionInfo[ColorPickerSelectedColorKey] = selectedColor
        }
        NotificationCenter.default.post(name: ColorPickerNotification, object: self, userInfo: selectionInfo)
    }
}
