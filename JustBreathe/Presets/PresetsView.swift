//
//  PresetsView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 1.2.2021.
//

import UIKit

class PresetsView: UIView {
    let controller: UIViewController
    let presetController: PresetController
    
    init(controller: UIViewController, presetController: PresetController) {
        let scrollArea = UIView()
        self.controller = controller
        self.presetController = presetController

        super.init(frame: CGRect.zero)
        
        addSubview(scrollArea)
        scrollArea.snp.makeConstraints { (make) in
            make.height.equalTo(323)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        let presetScrollview = UIScrollView()
        presetScrollview.isPagingEnabled = true
        presetScrollview.clipsToBounds = false
        presetScrollview.showsHorizontalScrollIndicator = false
        presetScrollview.showsVerticalScrollIndicator = false
        scrollArea.addSubview(presetScrollview)
        presetScrollview.snp.makeConstraints { (make) in
            make.height.equalTo(323)
            make.width.equalTo(285)
            make.center.equalToSuperview()
        }
        
        scrollArea.addGestureRecognizer(presetScrollview.panGestureRecognizer)

        let presetStackView = UIStackView()
        presetStackView.axis = .horizontal
        presetStackView.distribution = .equalSpacing
        presetStackView.spacing = 32
        presetScrollview.addSubview(presetStackView)
        presetStackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalToSuperview()
        }
        
        let placeholderViewBeginning = UIView()

        let placeholderViewEnd = UIView()
        presetStackView.addArrangedSubview(placeholderViewBeginning)

        for preset in presetController.presetList {
            let presetView = UIView()
            presetView.backgroundColor = R.color.white20()
            presetView.layer.cornerRadius = 16
            presetView.isUserInteractionEnabled = true
            let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPreset))
            gesture.numberOfTapsRequired = 1
            presetView.addGestureRecognizer(gesture)
            
            let nameLabel = UILabel()
            nameLabel.text = preset.name
            nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            nameLabel.textColor = R.color.white80()
            
            presetView.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }
            
            presetStackView.addArrangedSubview(presetView)
            
            presetView.snp.makeConstraints { (make) in
                make.width.equalTo(253)
                make.height.equalTo(323)
            }
        }
        
        presetStackView.addArrangedSubview(placeholderViewEnd)
        
        placeholderViewBeginning.snp.makeConstraints { (make) in
            make.width.equalTo(0)
            make.height.equalTo(323)
        }

        placeholderViewEnd.snp.makeConstraints { (make) in
            make.width.equalTo(0)
            make.height.equalTo(323)
        }
        
        let addPresetButton = UIButton(label: "Add Preset")
        addPresetButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        addPresetButton.setImage(UIImage.plusSymbol, for: .normal)
        addPresetButton.imageView?.contentMode = .scaleAspectFit
        addPresetButton.imageEdgeInsets = UIEdgeInsets(top: 16, left: -2, bottom: 16, right: 2)
        addSubview(addPresetButton)
        addPresetButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(152)
            make.height.equalTo(44)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
        
    }

    @objc func didTapPreset() {
        let presetDetailsViewController = PresetDetailsViewController(style: .grouped)
        self.controller.show(presetDetailsViewController, sender: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
