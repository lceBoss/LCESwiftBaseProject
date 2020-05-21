//
//  LCETabBarController.swift
//  LCESwiftBaseProject
//
//  Created by mac on 2020/5/18.
//  Copyright © 2020 iwchina. All rights reserved.
//

import UIKit

private let LCETabBarItemButtonTag: Int = 666
private let LCETabBarTitleLabelTag: Int = 999

class LCETabBarController: UITabBarController {
    
    private let itemTitles = ["首页", "我的"]
    private let defalutItemIcons = ["icon_tabbar_home", "icon_tabbar_me"]
    private let seletedItemIcons = ["icon_tabbar_home_seleted", "icon_tabbar_me_seleted"]
    private let defaultItemColor = lceTextColor
    private let seletedItemColor = lceThemeColor
    
    private var itemButtons = [UIButton]()
    
    var homeVC: LCEHomeViewController!
    var meVC: LCEMeViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.autoresizesSubviews = false
        
        self.tabBar.isHidden = true
        self.view.addSubview(self.tabBarView)
        // 配置item按钮
        self.setUpItems()
    }
    
    func setUpItems() -> Void {
        homeVC = LCEHomeViewController()
        meVC = LCEMeViewController()
        self.viewControllers = [homeVC, meVC]
        
        let buttonWidth = LCE_SCREEN_WIDTH / CGFloat(itemTitles.count)
        for i in 0 ..< itemTitles.count {
            
            let itemTitle = self.itemTitles[i]
            let defaultItemIcon = self.defalutItemIcons[i]
            let seletedItemIcon = self.seletedItemIcons[i]
            
            // button（集成自UIView）
            let itemButton = UIButton(type: .custom)
            itemButton.frame = CGRect(x: CGFloat(i) * buttonWidth, y: 0, width: buttonWidth, height: 49)
            itemButton.tag = i + LCETabBarItemButtonTag
            itemButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
            itemButton.setImage(UIImage(named: defaultItemIcon), for: .normal)
            itemButton.setImage(UIImage(named: seletedItemIcon), for: .selected)
            itemButton.adjustsImageWhenHighlighted = false
            itemButton.addTarget(self, action: #selector(tabBarPressed(button:)), for: .touchUpInside)
            
            // 底部label
            let titleLabelFrame: CGRect = CGRect(x: 0, y: LCE_TAB_TITLEMARGIN, width: buttonWidth, height: 20)
            // 底部title
            let titleLabel = UILabel(frame: titleLabelFrame)
            titleLabel.tag = LCETabBarTitleLabelTag
            titleLabel.text = itemTitle
            titleLabel.textColor = self.defaultItemColor
            titleLabel.font = .systemFont(ofSize: 12.0)
            titleLabel.textAlignment = .center
            
            itemButton.addSubview(titleLabel)
            
            if (i == 0) {
                titleLabel.textColor = self.seletedItemColor
                self.tabBarPressed(button: itemButton)
                itemButton.isSelected = true
            }
            
            tabBarView.addSubview(itemButton)
            self.itemButtons.append(itemButton)
        }
    }
    
    @objc func tabBarPressed(button: UIButton) {
        if button.isSelected {
            return
        }
        
        let index: Int = button.tag - LCETabBarItemButtonTag
        self.selectedIndex = index
        
        let currentVC = self.viewControllers![index]
        self.title = currentVC.title;
        self.navigationItem.titleView = currentVC.navigationItem.titleView;
        self.navigationItem.rightBarButtonItem = currentVC.navigationItem.rightBarButtonItem;
        self.navigationItem.leftBarButtonItem = currentVC.navigationItem.leftBarButtonItem;
        
        for itemButton in self.itemButtons {
            let buttonSelected = itemButton.isEqual(button)
            itemButton.isSelected = buttonSelected
            
            let label: UILabel = itemButton.viewWithTag(LCETabBarTitleLabelTag) as! UILabel
            label.textColor = buttonSelected ? self.seletedItemColor : self.defaultItemColor
        }
    }
    
    private lazy var tabBarView: UIView = {
        let tabBarView = UIView(frame: CGRect(x: 0, y: (LCE_SCREEN_HEIGHT - LCE_TAB_HEIGHT), width: LCE_SCREEN_WIDTH, height: LCE_TAB_HEIGHT))
        tabBarView.backgroundColor = .white
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: LCE_SCREEN_WIDTH, height: 1))
        lineView.backgroundColor = lceLineColor
        tabBarView.addSubview(lineView)
        return tabBarView
    }()

}
