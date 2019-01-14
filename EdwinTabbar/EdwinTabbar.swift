//
//  EdwinTabbar.swift
//  EdwinTabbar
//
//  Created by Edwin on 2018/7/21.
//  Copyright © 2018 Edwin. All rights reserved.
//

import UIKit

class EdwinTabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = UIColor.white
        tabBar.tintColor = UIColor.white
        viewControllers = [createViewController(title: "Home", image: "home", selectedImage: "homeselected"),createViewController(title: "Home", image: "home", selectedImage: "homeselected"),createViewController(title: "", image: "null", selectedImage: "null"),createViewController(title: "Favor", image: "favor", selectedImage: "favorselected"),createViewController(title: "Favor", image: "favor", selectedImage: "favorselected")]
        setupMiddleButton()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func createViewController(title:String,image:String,selectedImage:String,centred:Bool = false)->UINavigationController{
        let view = UINavigationController(rootViewController: UIViewController())
            view.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysOriginal)
            view.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
            view.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.orange], for: UIControlState.selected)
        return view
        
    }
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 40
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        //        menuButton.backgroundColor = UIColor.white
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)
        menuButton.layer.borderWidth = 2
        menuButton.layer.borderColor = UIColor.white.cgColor
        menuButton.setImage(UIImage(named: "photo_big")?.withRenderingMode(.alwaysOriginal), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
        menuButton.backgroundColor = UIColor.orange
        
        view.layoutIfNeeded()
    }
    @objc func menuButtonAction(sender:UIButton){
        selectedIndex = 2
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1.0,1.3,0.9,1.15,0.95,1.02,1.0]
        animation.duration = 1;
        animation.calculationMode = kCAAnimationCubic;
        sender.layer.add(animation, forKey: nil)
    }

}
