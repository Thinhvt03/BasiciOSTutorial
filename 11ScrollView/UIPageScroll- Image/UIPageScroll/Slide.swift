//
//  Slide.swift
//  UIPageScroll
//
//  Created by Hoàng Loan on 10/01/2023.
//

import UIKit

class Slide: UIView {

    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var titleLable: UILabel!
    
}

func createSlide() -> [Slide] {
    
    let slide1: Slide = Bundle.main.loadNibNamed("SlideView", owner: Slide.self)?.first as! Slide
    let slide2: Slide = Bundle.main.loadNibNamed("SlideView", owner: Slide.self)?.first as! Slide
    let slide3: Slide = Bundle.main.loadNibNamed("SlideView", owner: Slide.self)?.first as! Slide
    let slide4: Slide = Bundle.main.loadNibNamed("SlideView", owner: Slide.self)?.first as! Slide
    
    slide1.imageView.image = UIImage(named: "nuimuadong")
    slide1.titleLable.text = "Vẻ Đẹp Thiên Nhiên"
    
    slide2.imageView.image = UIImage(named: "nuirungdep")
    slide2.titleLable.text = "Vẻ Đẹp Thiên Nhiên"
    
    slide3.imageView.image = UIImage(named: "ruongbacthang")
    slide3.titleLable.text = "Vẻ Đẹp Thiên Nhiên"
    
    slide4.imageView.image = UIImage(named: "suongmu")
    slide4.titleLable.text = "Vẻ Đẹp Thiên Nhiên"

    return [slide1, slide2, slide3, slide4]
    
}
