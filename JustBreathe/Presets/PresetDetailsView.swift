//
//  PresetDetailsView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 18.2.2021.
//

import UIKit

class PresetDetailsView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        let background = UIImage(named: "bg-purple")
        let imageView = UIImageView(frame: self.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = self.center
        backgroundView = imageView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
