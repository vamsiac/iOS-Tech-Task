//
//  AccountsViewController.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import UIKit
import Networking

class AccountsViewController: UIViewController {
	// MARK: - Properties -
	
	// MARK: Outlets
	@IBOutlet private weak var tableView: UITableView!
	
	// MARK: Internal
	var viewModel: AccountsViewModel!
	var firstName: String!
	
	// MARK: - Functions -
	// MARK: Overrides
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = AccountsViewModel(delegate: self)
		title = viewModel.title
		viewModel.fetchAccounts()
	}
}

// MARK: - UITableViewDataSource -

extension AccountsViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		viewModel.accounts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reusableId) as? AccountTableViewCell
		else {
			fatalError("AccountTableViewCell is not configured")
		}
		
		let account = viewModel.accounts[indexPath.row]
		let cellViewModel = AccountTableViewCellModel(
			accountName: account.name,
			planValue: viewModel.getPlanValue(for: account),
			moneyboxValue: viewModel.getMoneyBoxValue(for: account))
		cell.configure(with: cellViewModel)
		
		return cell
	}
}

// MARK: - UITableViewDelegate -

extension AccountsViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let view = tableView.dequeueReusableCell(
			withIdentifier: "AccountsTableViewHeader") as? AccountsTableViewHeader
		else  {
			fatalError("AccountsTableViewHeader is not configured")
		}
		let headerViewModel = AccountsTableViewHeaderViewModel(
			firstName: firstName,
			totalPlanValue: viewModel.totalPlanValue)
		view.configure(with: headerViewModel)
		return view
	}
}

// MARK: - AccountsViewModelDelegate -

extension AccountsViewController: AccountsViewModelDelegate {
	func didFetchAccounts() {
		tableView.reloadData()
	}
	
	func failedToFetchAccounts() {
		//TODO: show error
	}
}
