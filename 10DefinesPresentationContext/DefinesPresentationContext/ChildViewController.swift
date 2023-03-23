//
//  ChildViewController.swift
//  SearchController
//
//  Created by Nguyen Dac Trung on 23/12/2022.
//

import UIKit

class ChildViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        
    }
    
    @IBAction func tap(_ sender: Any) {
        let controller = UIViewController()
       // controller.view.backgroundColor = .red
        let imageView = UIImageView()
       
        
        imageView.image = UIImage(named: "ruongbacthang")
        controller.view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: controller.view.bounds.width - 16),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            imageView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor)
        ])
        
        controller.modalPresentationStyle = .currentContext
        present(controller, animated: true)
    }
    
}
