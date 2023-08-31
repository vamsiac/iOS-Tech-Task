//
//  AccountsViewModelTests.swift
//  MoneyBoxTests
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import XCTest
@testable import Networking
@testable import MoneyBox

class AccountsViewModelTests: XCTestCase {
	
	var sut: AccountsViewModel!
	var mockViewController = MockViewController()
	
	override func setUp() {
		super.setUp()
		sut = AccountsViewModel(
			delegate: mockViewController,
			dataProvider: DataProviderMock())
	}
	
	func test_title_isUserAccounts() {
		XCTAssertEqual(sut.title, "User Accounts")
	}
	
	func test_fetchAccounts_whenValidResponse_shouldCallDidFetchAccounts() {
		XCTAssertTrue(mockViewController.calledFunctions.isEmpty)
		sut.fetchAccounts()
		XCTAssertTrue(mockViewController.calledFunctions.contains("didFetchAccounts()"))
	}
	
	func test_getProduct_whenWrappedIdInProducts_shouldReturnProduct() {
		sut.fetchAccounts()
		
		let product = sut.getProduct(
			for: Account.mock(wrapperId: "b9eaa523-cdd5-46c6-8353-9d538da845e0"))
		XCTAssertNotNil(product)
	}
	
	func test_getProduct_whenWrappedIdIsNotInProducts_shouldReturnPlanValue() {
		sut.fetchAccounts()
		
		let product = sut.getProduct(
			for: Account.mock(wrapperId: "Wrap-id-not-in-stub"))
		XCTAssertNil(product)
	}
}

extension AccountsViewModelTests {
	class MockViewController: AccountsViewModelDelegate {
		var calledFunctions: [String] = []

		func didFetchAccounts() {
			calledFunctions.append(#function)
		}
		
		func failedToFetchAccounts() {
			calledFunctions.append(#function)
		}
	}
}


