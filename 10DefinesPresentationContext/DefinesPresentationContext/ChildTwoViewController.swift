//
//  ChildTwoViewController.swift
//  DefinesPresentationContext
//
//  Created by Hoàng Loan on 31/01/2023.
//

import UIKit

class ChildTwoViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  imageView.image = UIImage(named: "ruongbacthang")
        let tapGestureToImage = UITapGestureRecognizer(target: self, action: #selector(tapToImage))
        tapGestureToImage.numberOfTapsRequired = 1
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureToImage)
        
    }
    
    @objc func tapToImage() {
        
        
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
    

