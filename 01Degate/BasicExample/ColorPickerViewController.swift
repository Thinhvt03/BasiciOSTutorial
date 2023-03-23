//
//  ColorPickerViewController.swift
//  BasicExample
//
//  Created by Nguyen Dac Trung on 23/11/2022.
//

import UIKit

protocol ColorPickerDelegate: AnyObject {
    func colorPicker(picker: ColorPickerViewController, didPickColor color: UIColor?)
}

class ColorPickerViewController: UIViewController {
    // Properties
    @IBOutlet weak var colorsSegmentedControl: UISegmentedControl!
    weak var delegate: ColorPickerDelegate?
    let colors = [("Cyan", UIColor.cyan),  ("Magenta", UIColor.magenta), ("Yellow", UIColor.yellow)]

    override func viewDidLoad() {
        super.viewDidLoad()
        colorsSegmentedControl.removeAllSegments()
        for (index, color) in colors.enumerated() {
            colorsSegmentedControl.insertSegment(withTitle: color.0, at: index, animated: true)
        }
        colorsSegmentedControl.selectedSegmentIndex = 0
    }
    
    func colorFromSelection() -> UIColor? {
        let selectedIndex = colorsSegmentedControl.selectedSegmentIndex
        return colors[selectedIndex].1
    }
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        delegate?.colorPicker(picker: self, didPickColor: colorFromSelection())
    }
}
