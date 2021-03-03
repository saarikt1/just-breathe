//
//  PresetDetailsView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 17.2.2021.
//

import UIKit

class PresetDetailsViewController: UITableViewController {
    let cellIdentifier = "cellTypeIdentifier"
    let presetController: PresetController!
    let breathDescriptions = ["Inhale", "Hold", "Exhale", "Hold"]
    let breathCounts: [Int]
    
    init(presetController: PresetController) {
        self.presetController = presetController
        breathCounts = [
            presetController.selectedPreset.inhale,
            presetController.selectedPreset.firstHold,
            presetController.selectedPreset.exhale,
            presetController.selectedPreset.secondHold
        ]
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = PresetDetailsView(frame: CGRect.zero, style: .grouped)
        title = "\(presetController.selectedPreset.name)"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.snp.makeConstraints { (make) in
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = R.color.white20()
        cell.textLabel?.textColor = R.color.white80()
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        cell.indentationWidth = 22
        cell.indentationLevel = 1
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            let inhaleTextField = PickerViewTextField()
            inhaleTextField.frame = CGRect(x: 0, y: 0, width: 48, height: 28)
            inhaleTextField.text = "\(breathCounts[indexPath.row])"
            inhaleTextField.textColor = .white
            inhaleTextField.textAlignment = .center
            inhaleTextField.backgroundColor = R.color.white30()
            inhaleTextField.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            inhaleTextField.layer.cornerRadius = 8
            inhaleTextField.layer.masksToBounds = true
            
            cell.textLabel!.text = "\(breathDescriptions[indexPath.row])"
            cell.accessoryType = .disclosureIndicator
            cell.accessoryView = inhaleTextField
        } else {
            cell.tintColor = R.color.white80()
            let image = UIImage(systemName: "chevron.right")
            let chevron = UIImageView(image: image)
            cell.accessoryView = chevron
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Steps"
        case 1:
            return "Sounds"
        case 2:
            return "Theme"
        default:
            return "Additional section"
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 68.0
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = R.color.white100()
        header.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        header.textLabel?.text = header.textLabel?.text?.localizedCapitalized
    }
    
    
}
