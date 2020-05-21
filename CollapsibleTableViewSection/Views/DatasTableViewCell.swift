//
//  DatasTableViewCell.swift
//  CollapsibleTableViewSection
//
//  Created by Antonio Posabella on 21/05/2020.
//  Copyright © 2020 bellaposa. All rights reserved.
//

import UIKit

class DatasTableViewCell: UITableViewCell {
	//MARK: - Outlet
	@IBOutlet weak var informationLabel: UILabel!
	
	
	var item: CollapsibleSectionItem? {
		didSet {
			guard let item = item as? InformationItem else { return }
			informationLabel.text = item.details
		}
	}
}


extension DatasTableViewCell {
	static var nib: UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	static var identifier: String {
		return String(describing: self)
	}
}
