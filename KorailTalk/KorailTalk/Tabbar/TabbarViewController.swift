//
//  TabbarViewController.swift
//  KorailTalk
//
//  Created by Jung peter on 11/12/22.
//

// TODO: ViewController 4개 연결해야함
// TODO: 첫번째로 보여질 친구 만들어줘야겠지?
// TODO: 뷰가 네비게이션인지 아닌지도 파악해줘야

import UIKit


class TabbarViewController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
        self.tabBar.itemPositioning = .centered
        self.tabBar.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let bookingViewController = bookingViewController()
        let bookingNavigationController =  UINavigationController(rootViewController: bookingViewController)
        bookingNavigationController.navigationBar.isHidden = true
        
        let discountViewController = discountViewController()
        let discountNavigationController = UINavigationController(rootViewController: discountViewController)
        discountNavigationController.navigationBar.isHidden = true
        
        let productViewController = productViewController()
        let productNavigationController = UINavigationController(rootViewController: productViewController)
        productNavigationController.navigationBar.isHidden = true
        
        let ticketViewController = ticketViewController()
        let ticketNavigationController = UINavigationController(rootViewController: ticketViewController)
        ticketNavigationController.navigationBar.isHidden = true
        
        
        
        let viewControllers = [
            bookingNavigationController,
            discountNavigationController,
            productNavigationController,
            ticketNavigationController
        ]
        
        self.setViewControllers(viewControllers, animated: true)
        
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barStyle = UIBarStyle.default
        tabBar.barTintColor = UIColor.white
        
        
        let imageNames = [
            "tab_menu_booking",
            "tab_menu_discount",
            "tab_menu_product",
            "tab_menu_ticket"
        ]
        
        let imageSelectedNames = [
            "tab_menu_booking_on",
            "tab_menu_discount_on",
            "tab_menu_product_on",
            "tab_menu_ticket_on"
        ]
        
        
        for (index, value) in (tabBar.items?.enumerated())! {
            let tabBarItem: UITabBarItem = value as UITabBarItem
            
            tabBarItem.image = UIImage(named: imageNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.selectedImage = UIImage(named: imageSelectedNames[index])?.withRenderingMode(.alwaysOriginal)
            tabBarItem.accessibilityIdentifier = imageNames[index]
        }
    }
}

extension TabbarViewController : UITabBarControllerDelegate {
    
    
}
