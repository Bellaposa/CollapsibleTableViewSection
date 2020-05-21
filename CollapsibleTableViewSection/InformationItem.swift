//
//  InformationItem.swift
//  CollapsibleTableViewSection
//
//  Created by Antonio Posabella on 21/05/2020.
//  Copyright © 2020 bellaposa. All rights reserved.
//

import Foundation

class InformationItem: CollapsibleSectionItem {
	
	var type: CollapsibleSectionItemType {
		return .information
	}
	
	var sectionTitle: String {
		return name
	}
	
	var isCollapsed: Bool = true
	
	var name: String
	
	var details: String
	
	init(name: String, details: String) {
		self.name = name
		self.details = details
	}
	
}
