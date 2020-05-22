//
//  CollapsibleSection.swift
//  CollapsibleTableViewSection
//
//  Created by bellaposa on 21/05/2020.
//  Copyright © 2020 bellaposa. All rights reserved.
//

import Foundation
import UIKit

enum CollapsibleSectionItemType {
	case information
}

protocol CollapsibleSectionItem {
	var type: CollapsibleSectionItemType { get }
	var sectionTitle: String { get }
	var rowCount: Int { get }
	var isCollapsible: Bool { get }
	var isCollapsed: Bool { get set }
}

class CollapsibleSection: NSObject {
	
	var items = [CollapsibleSectionItem]()
	var reloadSections: ((_ section: Int) -> Void)?
	
	override init() {
		super.init()
	
		// load data
		guard let dataFromFile = dataFromFile() else { return }
		
		let data = try? JSONDecoder().decode(MockData.self, from: dataFromFile)

		items.append(contentsOf: data?.datas.map { InformationItem(name: $0.name, details: $0.details) } ?? [])
	}
}

extension CollapsibleSection: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let item = items[section]
		guard item.isCollapsible else {
			return item.rowCount
		}
		
		return item.isCollapsed ? 0 : item.rowCount
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let item = items[indexPath.section]
		
		if let cell = tableView.dequeueReusableCell(withIdentifier: DatasTableViewCell.identifier, for: indexPath) as? DatasTableViewCell {
			cell.item = item
			return cell
		}
		return UITableViewCell()
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return items.count
	}
}

extension CollapsibleSectionItem {
	var rowCount: Int {
		return 1
	}
	
	var isCollapsible: Bool {
		return true
	}
}

extension CollapsibleSection: UITableViewDelegate {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderView.identifier) as? HeaderView {
			let item = items[section]
			
			headerView.item = item
			headerView.section = section
			headerView.delegate = self
			return headerView
		}
		return UIView()
	}
}

extension CollapsibleSection: HeaderViewDelegate {
	func toggleSection(header: HeaderView, section: Int) {
		var item = items[section]
		
		if item.isCollapsible {
			
			// toggle collapse
			let collapsed = !item.isCollapsed
			item.isCollapsed = collapsed
			header.setCollapsed(collapsed: collapsed)
			
			reloadSections?(section)
		}
	}
}

