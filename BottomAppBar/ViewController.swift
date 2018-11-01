//
//  ViewController.swift
//  BottomAppBar
//
//  Created by developersancho on 1.11.2018.
//  Copyright © 2018 developersancho. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents.MaterialBottomAppBar

class ViewController: UIViewController {
    @IBOutlet weak var bottomAppBar: MDCBottomAppBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomAppBar.barTintColor = UIColor.red
        bottomAppBar.floatingButton.backgroundColor = .blue
        bottomAppBar.floatingButton.setImage(UIImage(named: "hand"), for: .normal)
        bottomAppBar.floatingButtonPosition = .center
        bottomAppBar.floatingButton.addTarget(self, action: #selector(onFloatButtonTapped), for: .touchUpInside)
        
        let barButtonLeadingItem = UIBarButtonItem(
            image: UIImage(named:"ic_menu"),
            style: .plain,
            target: self,
            action: #selector(onMenuButtonTapped))
        
        let barButtonTrailingItem = UIBarButtonItem(
            image: UIImage(named: "ic_search"),
            style: .plain,
            target: self,
            action: #selector(onSearchButtonTapped))
        
        bottomAppBar.leadingBarButtonItems = [ barButtonLeadingItem ]
        bottomAppBar.trailingBarButtonItems = [ barButtonTrailingItem ]
    }
    
    @objc
    func onMenuButtonTapped() {
        bottomAppBar.setFloatingButtonPosition(.trailing, animated: true)
    }
    
    @objc
    func onSearchButtonTapped() {
        bottomAppBar.setFloatingButtonPosition(.leading, animated: true)
    }
    
    @objc
    func onFloatButtonTapped(){
        bottomAppBar.setFloatingButtonPosition(.center, animated: true)
    }

}

