//
//  AccountDetailViewController.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import UIKit
import Networking

class AccountDetailViewController: UIViewController {
	// MARK: - Properties -
	
	// MARK: Outlets
	@IBOutlet private weak var accountNameLabel: UILabel!
	@IBOutlet private weak var moneyboxValueLabel: UILabel!
	@IBOutlet private weak var planValueLabel: UILabel!
	
	// MARK: Internal
	var viewModel: AccountDetailViewModel!
	var accountName: String!
	var product: ProductResponse?
	
	// MARK: - Functions -
	// MARK: Overrides
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = AccountDetailViewModel(delegate: self)
		title = viewModel.title
		showLabels()
	}
	
	private func showLabels() {
		accountNameLabel.text = accountName
		moneyboxValueLabel.text = "Plan Value: \(product?.moneybox?.asGBPCurrency ?? "")"
		planValueLabel.text = "Moneybox: \(product?.planValue?.asGBPCurrency ?? "")"
	}
	
	@IBAction func addTenPoundsTapped(_ sender: Any) {
		guard let product = product
		else { return }
		viewModel.addTenPounds(to: product)
	}
	
}

// MARK: - AccountDetailViewModel -

extension AccountDetailViewController: AccountDetailViewModelDelegate {
	func successfullyAdded(moneybox: Double) {
		moneyboxValueLabel.text = "Plan Value: \(moneybox.asGBPCurrency)"
	}
	
	func failedAddingMoney() {
		//TODO: handle error
	}
	
	
}

