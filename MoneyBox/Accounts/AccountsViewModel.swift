//
//  AccountsViewModel.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import Foundation
import Networking

protocol AccountsViewModelDelegate: AnyObject {
	func didFetchAccounts()
	func failedToFetchAccounts()
}

class AccountsViewModel {
	// MARK: - Properties -
	
	// MARK: Internal
	
	var accounts: [Account] = []
	var totalPlanValue: Double?
	var title = "User Accounts"
	
	// MARK: Private
	
	private var products: [ProductResponse] = []
	private let dataProvider: DataProviderLogic
	private weak var delegate: AccountsViewModelDelegate?
	
	// MARK: Init
	
	init(
		delegate: AccountsViewModelDelegate,
		dataProvider: DataProviderLogic = DataProvider()
	) {
		self.delegate = delegate
		self.dataProvider = dataProvider
	}
	
	// MARK: - Functions -
	
	func fetchAccounts() {
		dataProvider.fetchProducts { [weak self] result in
			switch result {
				case .success(let success):
					self?.accounts = success.accounts ?? []
					self?.products = success.productResponses ?? []
					self?.totalPlanValue = success.totalPlanValue
					self?.delegate?.didFetchAccounts()
				case .failure(_):
					self?.delegate?.failedToFetchAccounts()
			}
		}
	}
	
	func getProduct(for account: Account) -> ProductResponse? {
		guard let product = products.first(where: {$0.wrapperID == account.wrapper?.id}) else {
			return nil
		}
		
		return product
	}
}
