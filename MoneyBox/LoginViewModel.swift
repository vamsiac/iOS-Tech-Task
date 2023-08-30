//
//  LoginViewModel.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import Foundation
import Networking

protocol LoginViewModelDelegate: AnyObject {
	func userSuccessfullyLoggedIn()
	func userFailedToLogin(with error: Error)
}

class LoginViewModel {
	
	weak var delegate: LoginViewModelDelegate!
	
	private let dataProvider: DataProviderLogic
	
	init(
		dataProvider: DataProviderLogic = DataProvider()
	) {
		self.dataProvider = dataProvider
	}
	
	func startLogin(with email: String, password: String) {
		dataProvider.login(
			request: LoginRequest(
				email: email,
				password: password)
		) { [weak self] result in
			switch result {
				case .success(_):
					self?.delegate.userSuccessfullyLoggedIn()
				case .failure(let failure):
					self?.delegate.userFailedToLogin(with: failure)
			}
		}
	}
}
