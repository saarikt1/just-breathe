//
//  ViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 27.1.2021.
//

import UIKit
import SnapKit

class StartScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        let image = UIImage(named: "icon-calm")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let title = UILabel()
        title.text = "4-7-8"
        title.textColor = .white
        view.addSubview(title)
        title.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
    
}

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
        self.view.sendSubviewToBack(imageView)
    }
}
