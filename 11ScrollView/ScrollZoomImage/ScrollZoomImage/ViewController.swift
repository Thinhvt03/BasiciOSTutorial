//
//  ViewController.swift
//  ScrollZoomImage
//
//  Created by Hoàng Loan on 18/03/2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageView.image = UIImage(named: "songnui")
        scrollView.maximumZoomScale = 10
        scrollView.minimumZoomScale = 0.25
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
