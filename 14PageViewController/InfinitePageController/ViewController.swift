//
//  ViewController.swift
//  InfinitePageController
//
//  Created by Nguyen Dac Trung on 13/01/2023.
//
 import UIKit

 class ContentVC: UIViewController {
     var index: Int = 0
     
     private let label = UILabel()
     private let images = UIImageView()
     let numberImage = [ "dongsong","nuimuadong","nuirungdep", "ruongbacthang", "suongmu" ]
     
     override func viewDidLoad() {
         super.viewDidLoad()
         images.addSubview(label)
         label.textAlignment = .center
         label.font = .preferredFont(forTextStyle: .largeTitle)
         label.text = "\(index)"
         label.textColor = .magenta
         
         view.addSubview(images)
         images.image = UIImage(named: numberImage[index])
         
 //        view.backgroundColor = UIColor(hue: CGFloat(index) / 10, saturation: 1, brightness: 1, alpha: 1)
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
         label.frame = CGRect(x: 20, y: 20, width: 30, height: 30)
         images.frame = view.bounds
     }
 }

 class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
     
     var viewControllers: [UIViewController] = []
     let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
     
     override func viewDidLoad() {
         super.viewDidLoad()
         setupViewController()
     }
     func setupViewController() {
         
         for i in 0..<4 {
             let content = ContentVC()
             content.index = i+1
             viewControllers.append(content)
         }
         
         addChild(pageViewController)
         view.addSubview(pageViewController.view)
         pageViewController.didMove(toParent: self)
         pageViewController.dataSource = self
         pageViewController.delegate = self
         
         pageViewController.setViewControllers([viewControllers.first!], direction: .forward, animated: true)
         
         Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [self] _ in
             guard let currentPAge = pageViewController.viewControllers?.first! else {return}
             if let index = viewControllers.firstIndex(of: currentPAge) {
                 var next: Int
                 if index < viewControllers.count-1 {
                     next = index+1
                 } else {
                     next = 0
                 }
                 pageViewController.setViewControllers([viewControllers[next]], direction: .forward, animated: true)
             }
         }
     }
     
     override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        // pageViewController.view.frame = view.bounds
         pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
             pageViewController.view.widthAnchor.constraint(equalToConstant: 350),
             pageViewController.view.heightAnchor.constraint(equalToConstant: 250),
             pageViewController.view.centerXAnchor.constraint(equalTo: view.centerXAnchor)
         ])
     }
     
     // MARK: - UIPageViewControllerDataSource
     
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
         guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count else { return nil }

         if index == 0 {
             return viewControllers.last
         }
         
         return viewControllers[index - 1]
     }
     
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
         guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count else { return nil }
         
         if index == viewControllers.count - 1 {
             return viewControllers.first
         }
         
         return viewControllers[index + 1]
     }
     
     // MARK: - UIPageViewControllerDelegate
     
    //  Number of indicator for page control
     func presentationCount(for pageViewController: UIPageViewController) -> Int {
         viewControllers.count
     }
 
     // Current number of page control
     func presentationIndex(for pageViewController: UIPageViewController) -> Int {
         guard let current = pageViewController.viewControllers?.first else { return 0 }
         return viewControllers.firstIndex(of: current) ?? 0
     }
 }

