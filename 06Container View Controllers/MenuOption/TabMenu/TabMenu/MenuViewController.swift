//
//  MenuViewController.swift
//  TabMenu
//
//  Created by Hoàng Loan on 22/12/2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var viewOfContainer: UIView!
    @IBOutlet weak var tableViewOfMenu: UITableView!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    // MARK: - Properties
    
    var viewControllerArray: [UIViewController] = []
    
    var viewControllers: [UIViewController]  {
        get {
            return viewControllerArray
        }
        set {
            viewControllerArray = newValue
            if activeViewController == nil || viewControllerArray.firstIndex(of: activeViewController) == nil {
                activeViewController = viewControllerArray.first
            }
        }
    }
    
    private var activeViewController: UIViewController! {
        didSet {
            removeInActiveViewController(inActiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    
// MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOfMenu.delegate = self
        tableViewOfMenu.dataSource = self
        updateActiveViewController()
        self.tableViewHeight.constant = 0
        tableViewOfMenu.rowHeight = 50
        tableViewOfMenu.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
// MARK: - Support switch VC
    
    private func removeInActiveViewController(inActiveViewController: UIViewController?) {
        if isViewLoaded {
            if let inactive = inActiveViewController {
                inactive.willMove(toParent: nil)
                inactive.view.removeFromSuperview()
                inactive.removeFromParent()
            }
        }
    }
    
    private func updateActiveViewController() {
        if isViewLoaded {
            if let active = activeViewController {
                addChild(active)
                active.view.frame = viewOfContainer.bounds
                viewOfContainer.addSubview(active.view)
                navigationTitle.title = active.title
                active.didMove(toParent: self)
            }
        }
    }
    
// MARK: - TabMenuOption

    @IBAction func DidButtonMenu(_ sender: Any) {
        if self.tableViewHeight.constant == 0 {
            showMenu()
        } else {
            hideMenu()
        }
    }
    
    func hideMenu() {
        self.tableViewHeight.constant = 0
        UIView.animate(withDuration: 0.5,delay: 0.0, options: .curveEaseInOut) {
            self.view.layoutSubviews()
        }
    }
    
    func showMenu() {
        let totalHeight = self.tableViewOfMenu.rowHeight * CGFloat(self.tableViewOfMenu.numberOfRows(inSection: 0))
        self.tableViewHeight.constant = totalHeight
        UIView.animate(withDuration: 0.5,delay: 0.0, options: .curveEaseInOut ) {
            self.view.layoutSubviews()
        }
    }
}

// MARK: - UITableView Data Source/Delegate
    
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewControllerArray.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewControllerArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewOfMenu.deselectRow(at: indexPath, animated: true)
        activeViewController = viewControllerArray[indexPath.row]
        hideMenu()
    }
}
