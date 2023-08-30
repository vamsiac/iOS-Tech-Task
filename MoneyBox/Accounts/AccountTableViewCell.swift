//
//  AccountTableViewCell.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import Foundation
import UIKit

class AccountTableViewCell: UITableViewCell {
	// MARK: - Properties -
	static let reusableId = "AccountTableViewCell"
	
	// MARK: Outlets
	@IBOutlet private weak var nameLabel: UILabel!
	@IBOutlet private weak var planLabel: UILabel!
	@IBOutlet private weak var moneyboxLabel: UILabel!
	
	// MARK: - Functions -
	// MARK: Overrides
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	
	// MARK: Internal
	func configure(with viewModel: AccountTableViewCellModel) {
		nameLabel.text = viewModel.accountName
		planLabel.text = "Plan Value: \(viewModel.planValue?.asGBPCurrency ?? "")"
		moneyboxLabel.text = "Moneybox: \(viewModel.moneyboxValue?.asGBPCurrency ?? "")"
	}
	
	// MARK: Private
	private func setup() {
		accessoryType = .disclosureIndicator
	}
}
