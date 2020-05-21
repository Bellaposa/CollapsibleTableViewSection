//
//  ViewController.swift
//  CollapsibleTableViewSection
//
//  Created by bellaposa on 21/05/2020.
//  Copyright © 2020 bellaposa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	
	fileprivate let collapsibleSection = CollapsibleSection()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collapsibleSection.reloadSections = { [weak self] (section: Int) in
			self?.tableView.beginUpdates()
			self?.tableView.reloadSections([section], with: .none)
			self?.tableView.endUpdates()
		}
		
		initTableView()
		
	}
}

extension ViewController {
	fileprivate func initTableView() {
		tableView.estimatedRowHeight = 90
		tableView.rowHeight = UITableView.automaticDimension
		tableView.sectionHeaderHeight = 60
		tableView.separatorStyle = .none
		// datasource ; delegate
		tableView.dataSource = collapsibleSection
		tableView.delegate = collapsibleSection
		tableView.register(DatasTableViewCell.nib, forCellReuseIdentifier: DatasTableViewCell.identifier)
		tableView.register(HeaderView.nib, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
	}
}
