//
//  OtherViewController.swift
//  BottomAppBar
//
//  Created by developersancho on 1.11.2018.
//  Copyright © 2018 developersancho. All rights reserved.
//

import UIKit
import MaterialComponents
import MaterialComponents.MaterialBottomAppBar

class OtherViewController: UIViewController {
    private let bottomBarView = MDCBottomAppBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        view.addSubview(bottomBarView)
        
        bottomBarView.floatingButton.setImage(UIImage(named: "hand"), for: .normal)
        bottomBarView.floatingButtonPosition = .center
        bottomBarView.barTintColor = .blue
        bottomBarView.floatingButton.backgroundColor = .red
        
        bottomBarView.floatingButton.addTarget(self, action: #selector(onFloatButtonTapped), for: .touchUpInside)
        
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
        
        bottomBarView.leadingBarButtonItems = [ barButtonLeadingItem ]
        bottomBarView.trailingBarButtonItems = [ barButtonTrailingItem ]
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        DispatchQueue.main.async {
            self.layoutBottomAppBar()
        }
    }
    
    private func layoutBottomAppBar() {
        let size = bottomBarView.sizeThatFits(view.bounds.size)
        let bottomBarViewFrame = CGRect(x: 0,
                                        y: view.bounds.size.height - size.height,
                                        width: size.width,
                                        height: size.height)
        bottomBarView.frame = bottomBarViewFrame
    }
    
    @objc
    func onMenuButtonTapped() {
        bottomBarView.setFloatingButtonPosition(.trailing, animated: true)
    }
    
    @objc
    func onSearchButtonTapped() {
        bottomBarView.setFloatingButtonPosition(.leading, animated: true)
    }
    
    @objc
    func onFloatButtonTapped(){
        bottomBarView.setFloatingButtonPosition(.center, animated: true)
    }
    
}
