//
//  PresetDetailsView.swift
//  JustBreathe
//
//  Created by Tommi Saarikangas on 17.2.2021.
//

import UIKit

class PresetDetailsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = PresetDetailsView(frame: CGRect.zero, style: .grouped)
        title = "Preset 3"
    }
}
