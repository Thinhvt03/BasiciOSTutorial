//
//  NameViewController.swift
//  NameViewController
//
//  Created by Hoàng Loan on 06/12/2022.
//

import UIKit

protocol NameControllerDelegate {
    func nameControl (mainVC: NameViewController , didSaveButton name: String)
}

class NameViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    
    // Mark: -Properties
    var fullName: String?
    var delegate: NameControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fullName = fullName.self {
            let firstLast = fullName.components(separatedBy: " ")
            firstName.text = firstLast[0]
            lastName.text = firstLast[1]
        }
        
        // creart seguecontrol Foo, Bar
                let segmentedControl = UISegmentedControl(items: ["Foo", "Bar"])
                segmentedControl.sizeToFit()
                let segmentedButton = UIBarButtonItem(customView: segmentedControl)
        
                let SaveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(didSaveButton))
                let CancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: nil)

                navigationItem.rightBarButtonItems = [SaveButton, segmentedButton]
                navigationItem.backBarButtonItem = CancelButton
        
          // Mark: - Set attribued TitleLabel
                let titleLabel = UILabel()
                let shadow = NSShadow()
        
                shadow.shadowColor = UIColor.systemPink.withAlphaComponent(0.5)
                shadow.shadowOffset = CGSizeMake(2, 2)
                shadow.shadowBlurRadius = 4

                let titleText = NSAttributedString(string: "Edit Name", attributes: [
                    NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 28),
                    NSAttributedString.Key.foregroundColor : UIColor(red: 0.8, green: 0.25, blue: 0.25, alpha: 1),
                    NSAttributedString.Key.shadow : shadow
                    ])

                titleLabel.attributedText = titleText
                titleLabel.sizeToFit()
                navigationItem.titleView = titleLabel
    }

    @objc func didSaveButton() {
        let name = firstName.text! + " " + lastName.text!
        delegate?.nameControl(mainVC: self, didSaveButton: name)
    }
}

