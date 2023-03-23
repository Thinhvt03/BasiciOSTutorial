//
//  ViewController.swift
//  NameViewController
//
//  Created by Hoàng Loan on 06/12/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, NameControllerDelegate{
    
    // Mark: -Properties
    var names = ["Brent Berg", "Cody Preston", "Kareem Dixon", "Xander Clark",
                 "Francis Frederick", "Carson Hopkins", "Anthony Nguyen", "Dean Franklin",
                 "Jeremy Davenport", "Rigel Bradford", "John Ball", "Zachery Norman",
                 "Valentine Lindsey", "Slade Thornton", "Jelani Dickson", "Vance Hurley",
                 "Wayne Ellison", "Kasimir Mueller", "Emery Pruitt", "Lucius Lawrence",
                 "Kenneth Mendez"]
    
    var selectIndexPath: IndexPath?
    var tableViewName: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Mark: - Lifecyle ViewController
        tableViewName = UITableView(frame: view.frame)
        tableViewName.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableViewName)
        tableViewName.dataSource = self
        tableViewName.delegate = self
        
        // Custom properties for Bar Navigation
        // 1: Attribued Image in background
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundImage = UIImage(named: "green")
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }else{
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "green"), for: .default)
        }
    
        navigationController?.navigationBar.tintColor = UIColor(red: 0.8, green: 0.25, blue: 0.25, alpha: 1)     // 2:

        // custom shadow (điều chỉnh đổ bóng )
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.systemPink.withAlphaComponent(0.25)       // 3 :
        shadow.shadowOffset = CGSizeMake(2, 2)                          // 4 :
        shadow.shadowBlurRadius = 4                                     // bán kính shadow
        
        // Hiển thị các thuộc tính cho title "Names" trong bar Navigation phía VC1
        let titleLabel = UILabel()
        let titleText = NSAttributedString(string: "Names", attributes: [
         NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30),
         NSAttributedString.Key.foregroundColor : UIColor(red: 0.8, green: 0.25, blue: 0.25, alpha: 1),             // 5 :
         NSAttributedString.Key.shadow : shadow          // 6:
        ])
         titleLabel.attributedText = titleText
         titleLabel.sizeToFit()
         navigationItem.titleView = titleLabel
    
        // 1 - Đặt hình nền cho 1 vị trí nhất định trên bar navigation, với 1 image và tại vị trí .compact
        //  2 -   Đặt tông màu nền cho bar navigation
        // 3 - tạo color gray khi shadow(đổ bóng) with component (thành phần) alpha(được giới hạn từ 0,0 -> 1,0)
        // 4 - vị trí độ lệch shadow theo width (chiều ngang) và high (chiều dọc) với kiểu dữ liệu CGSize (đây là 1 tiêu chuẩn) với HDH Mac là NSSize , còn các HDH khác thì sd CGSize
        // 5 - color of text
        // 6 - chọn kiểu shadow(đổ bóng)
    }
    
      // Mark: Method of UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewName.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameVC = NameViewController()
        nameVC.delegate = self
        nameVC.fullName = names[indexPath.row]
        tableViewName.deselectRow(at: indexPath, animated: true)
        selectIndexPath = indexPath
        
        navigationController?.pushViewController(nameVC, animated: true)
    }
    // Hàm xử lý khi có sự kiện thay đổi name
    func nameControl(mainVC: NameViewController, didSaveButton name: String) {
        if let indexPath = selectIndexPath {
            names[indexPath.row] = name
            tableViewName.reloadRows(at: [indexPath],with: .automatic)
            selectIndexPath = nil
        }
        navigationController?.popViewController(animated: true)
    }
    
}

