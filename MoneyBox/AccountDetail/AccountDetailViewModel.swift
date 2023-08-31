//
//  AccountDetailViewModel.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import Networking

protocol AccountDetailViewModelDelegate: AnyObject {
	func successfullyAdded(moneybox: Double)
	func failedAddingMoney()
}

class AccountDetailViewModel {
	// MARK: - Properties -
	
	let title = "Account details"
	
	// MARK: Private
	private weak var delegate: AccountDetailViewModelDelegate?
	private let dataProvider: DataProviderLogic
	
	init(
		delegate: AccountDetailViewModelDelegate?,
		dataProvider: DataProviderLogic = DataProvider()
	) {
		self.delegate = delegate
		self.dataProvider = dataProvider
	}
	
	// MARK: - Functions -
	
	func addTenPounds(to product: ProductResponse) {
		guard let productId = product.id
		else {
			print("productId missing")
			return
		}
		dataProvider.addMoney(
			request: OneOffPaymentRequest(
				amount: 10,
				investorProductID: productId)
		) {[weak self] result in
			switch result {
				case .success(let success):
					if let moneybox = success.moneybox {
						self?.delegate?.successfullyAdded(moneybox: moneybox)
					}
				case .failure(_):
					self?.delegate?.failedAddingMoney()
			}
		}
	}
}

