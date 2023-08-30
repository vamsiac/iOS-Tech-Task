//
//  DataProviderMock.swift
//  MoneyBoxTests
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import Foundation
@testable import Networking

class DataProviderMock: DataProviderLogic {
	func login(request: Networking.LoginRequest, completion: @escaping ((Result<Networking.LoginResponse, Error>) -> Void)) {
		StubData.read(file: "LoginSucceed", callback: completion)
	}
	
	func fetchProducts(completion: @escaping ((Result<Networking.AccountResponse, Error>) -> Void)) {
		StubData.read(file: "Accounts", callback: completion)
	}
	
	func addMoney(request: Networking.OneOffPaymentRequest, completion: @escaping ((Result<Networking.OneOffPaymentResponse, Error>) -> Void)) {}
}
