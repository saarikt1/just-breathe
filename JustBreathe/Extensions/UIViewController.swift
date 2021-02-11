//
//  UIViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 11.2.2021.
//

import UIKit

extension UIViewController {
    func setBackground(){
        let background = UIImage(named: "bg-purple")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
}

