//
//  ViewController.swift
//  BasicExample
//
//  Created by Nguyen Dac Trung on 23/11/2022.
//

import UIKit
class ViewController: UIViewController, ColorPickerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func openColorPickerTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let colorPickerVC = storyboard.instantiateViewController(withIdentifier: "ColorPicker") as! ColorPickerViewController
        colorPickerVC.delegate = self
        present(colorPickerVC, animated: true, completion: nil)
    }
    
    func colorPicker(picker: ColorPickerViewController, didPickColor color: UIColor?) {
        if let selectedColor = color {
            view.backgroundColor = selectedColor
        }
        dismiss(animated: true, completion: nil)
    }
}

