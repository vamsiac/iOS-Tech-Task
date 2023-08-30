//
//  AccountsTableViewHeader.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import UIKit

class AccountsTableViewHeader: UITableViewCell {
	
	// MARK: Outlets
	@IBOutlet private weak var nameLabel: UILabel!
	@IBOutlet private weak var totalPlanLabel: UILabel!
	
	// MARK: Internal
	func configure(with viewModel: AccountsTableViewHeaderViewModel) {
		nameLabel.text = "Hello \(viewModel.firstName)"
		totalPlanLabel.text = "Total Plan Value: \(viewModel.totalPlanValue?.asGBPCurrency ?? "")"
	}
}
