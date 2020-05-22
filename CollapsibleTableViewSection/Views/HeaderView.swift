//
//  HeaderView.swift
//  CollapsibleTableViewSection
//
//  Created by Antonio Posabella on 21/05/2020.
//  Copyright © 2020 bellaposa. All rights reserved.
//

import UIKit

protocol HeaderViewDelegate: class {
	func toggleSection(header: HeaderView, section: Int)
}

class HeaderView: UITableViewHeaderFooterView {
	// MARK: - Outlets
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var arrowImage: UIImageView!
	
	
	// MARK: - Variables
	var section: Int = 0
	weak var delegate: HeaderViewDelegate?
	
	
	var item: CollapsibleSectionItem? {
		didSet {
			guard let item = item else { return }
			titleLabel.text = item.sectionTitle
			setCollapsed(collapsed: item.isCollapsed)
		}
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
    
		addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapHandler)))
    }
	
	@objc private func didTapHandler() {
		delegate?.toggleSection(header: self, section: section)
	}
}

extension HeaderView {
	static var nib: UINib {
		return UINib(nibName: identifier, bundle: nil)
	}
	
	static var identifier: String {
		return String(describing: self)
	}
	
	func setCollapsed(collapsed: Bool) {
		arrowImage.image = UIImage(named: collapsed ? "arrowsDownBlack" : "arrowsUpBlack")
	}
}
