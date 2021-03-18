//
//  PresetsViewController.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 28.1.2021.
//

import UIKit

class PresetsViewController: UIViewController {
    private let viewModel: PresetViewModel
    
    init(_ presetViewModel: PresetViewModel) {
        self.viewModel = presetViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        let scrollablePresetView = newScrollablePresetView()
        let presetAddButton = newPresetAddButton()

        view.addSubview(scrollablePresetView)
        view.addSubview(presetAddButton)
        
        scrollablePresetView.snp.makeConstraints { (make) in
            make.height.equalTo(323)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        presetAddButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(152)
            make.height.equalTo(44)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
        }
    }
    
    private func newScrollablePresetView() -> UIView {
        let scrollableArea = UIView()

        let presetScrollView = UIScrollView()
        presetScrollView.isPagingEnabled = true
        presetScrollView.clipsToBounds = false
        presetScrollView.showsHorizontalScrollIndicator = false
        presetScrollView.showsVerticalScrollIndicator = false
        presetScrollView.delegate = self
        scrollableArea.addGestureRecognizer(presetScrollView.panGestureRecognizer)

        let presetStackView = UIStackView()
        presetStackView.axis = .horizontal
        presetStackView.distribution = .equalSpacing
        presetStackView.spacing = 32
        
        let placeholderViewBeginning = UIView()
        let placeholderViewEnd = UIView()
        
        scrollableArea.addSubview(presetScrollView)
        presetScrollView.addSubview(presetStackView)
        presetStackView.addArrangedSubview(placeholderViewBeginning)
        
        presetScrollView.snp.makeConstraints { (make) in
            make.height.equalTo(323)
            make.width.equalTo(285)
            make.center.equalToSuperview()
        }
        
        presetStackView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(-16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalToSuperview()
        }

        for preset in viewModel.presets {
            let presetView = UIView()
            presetView.backgroundColor = R.color.white20()
            presetView.layer.cornerRadius = 16
            presetView.isUserInteractionEnabled = true
            let gesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPreset))
            gesture.numberOfTapsRequired = 1
            presetView.addGestureRecognizer(gesture)

            let img = R.image.iconCalm()
            let presetIcon = UIImageView(image: img)
            presetIcon.contentMode = .scaleAspectFit

            let nameLabel = UILabel()
            nameLabel.text = preset.name
            nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            nameLabel.textColor = R.color.white80()

            let breathCountView = createBreathCountView(for: preset)

            presetView.addSubview(presetIcon)
            presetView.addSubview(nameLabel)
            presetView.addSubview(breathCountView)

            presetIcon.snp.makeConstraints { (make) in
                make.height.equalTo(100)
                make.centerX.equalToSuperview()
                make.top.equalTo(presetView.snp.top).offset(32)
            }
            nameLabel.snp.makeConstraints { (make) in
                make.center.equalToSuperview()
            }

            breathCountView.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.width.equalTo(100)
                make.height.equalTo(100)
                make.bottom.equalTo(presetView.snp.bottom).offset(-32)
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
        
        return scrollableArea
    }
    
    private func createBreathCountView(for preset: Preset) -> UIView {
        let containerView = UIView()
        let rowHeight = 17

        let tableContainer = UIStackView()
        tableContainer.axis = .vertical
        tableContainer.distribution = .equalSpacing
        containerView.addSubview(tableContainer)
        tableContainer.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }

        let inhaleLabel = BreathCountLabel()
        inhaleLabel.text = "\(preset.breathCounts.inhale)"
        
        let inhaleRow = createTextRow(labelText: "inhale", inhaleLabel)
        tableContainer.addArrangedSubview(inhaleRow)
        inhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(rowHeight)
        }

        let firstHoldLabel = BreathCountLabel()
        firstHoldLabel.text = "\(preset.breathCounts.firstHold)"
        
        let holdRow = createTextRow(labelText: "hold", firstHoldLabel)
        tableContainer.addArrangedSubview(holdRow)
        holdRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(rowHeight)
        }

        let exhaleLabel = BreathCountLabel()
        exhaleLabel.text = "\(preset.breathCounts.exhale)"
        
        let exhaleRow = createTextRow(labelText: "exhale", exhaleLabel)
        tableContainer.addArrangedSubview(exhaleRow)
        exhaleRow.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(rowHeight)
        }

        let secondHoldLabel = BreathCountLabel()
        secondHoldLabel.text = "\(preset.breathCounts.secondHold)"
        
        let holdRow2 = createTextRow(labelText: "hold", secondHoldLabel)
        tableContainer.addArrangedSubview(holdRow2)
        holdRow2.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(rowHeight)
        }

        return containerView
    }

    private func createTextRow(labelText: String, _ countLabel: UILabel) -> UIStackView {
        let textRow = UIStackView()
        textRow.distribution = .equalSpacing

        let label = UILabel()
        label.text = labelText
        label.textColor = R.color.white60()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)

        countLabel.textAlignment = .right
        countLabel.textColor = R.color.white60()
        countLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)

        textRow.addArrangedSubview(label)
        textRow.addArrangedSubview(countLabel)

        return textRow
    }
    
    private func newPresetAddButton() -> UIButton {
        let button = UIButton(label: "Add Preset")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setImage(UIImage.plusSymbol, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 16, left: -2, bottom: 16, right: 2)
        return button
    }
    
    @objc func didTapPreset() {
        let presetDetailsViewController = PresetDetailsViewController(with: viewModel)
        show(presetDetailsViewController, sender: self)
    }
}
    

// MARK: - UIScrollViewDelegate

extension PresetsViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let selectedPageIndex = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        viewModel.updateSelectedPreset(to: selectedPageIndex)
    }
}
