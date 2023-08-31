//
//  LoginViewModel.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import Foundation
import Networking

protocol LoginViewModelDelegate: AnyObject {
	func successfullyLoggedIn(with user: LoginResponse.User)
	func userFailedToLogin(with error: Error)
}

class LoginViewModel {
	// MARK: - Properties -
	
	// MARK: Private

	private weak var delegate: LoginViewModelDelegate?
	private let dataProvider: DataProviderLogic
	
	init(
		delegate: LoginViewModelDelegate?,
		dataProvider: DataProviderLogic = DataProvider()
	) {
		self.delegate = delegate
		self.dataProvider = dataProvider
	}
	
	// MARK: - Functions -
	
	func startLogin(with email: String, password: String) {
		dataProvider.login(
			request: LoginRequest(
				email: email,
				password: password)
		) { [weak self] result in
			switch result {
				case .success(let loginResponse):
					Authentication.token = loginResponse.session.bearerToken
					self?.delegate?.successfullyLoggedIn(with: loginResponse.user)
				case .failure(let failure):
					self?.delegate?.userFailedToLogin(with: failure)
			}
		}
	}
}
