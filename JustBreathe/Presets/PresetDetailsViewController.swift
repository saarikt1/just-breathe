//
//  PresetDetailsView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 17.2.2021.
//

import UIKit

class PresetDetailsViewController: UITableViewController {
    let cellIdentifier = "cellTypeIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = PresetDetailsView(frame: CGRect.zero, style: .grouped)
        title = "Preset 3"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
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
        
        cell.textLabel!.text = "Some settings here!"
        cell.backgroundColor = R.color.white20()
        cell.textLabel?.textColor = R.color.white80()

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
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = R.color.white100()
        header.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        header.textLabel?.text = header.textLabel?.text?.localizedCapitalized
    }
}
