//
//  AccountDetailViewModelTests.swift
//  MoneyBoxTests
//
//  Created by Vamsi Anguluru on 31/08/2023.
//

import XCTest
@testable import Networking
@testable import MoneyBox

class AccountDetailViewModelTests: XCTestCase {
	
	var sut: AccountDetailViewModel!
	var mockViewController = MockViewController()
	
	override func setUp() {
		super.setUp()
		sut = AccountDetailViewModel(
			delegate: mockViewController,
			dataProvider: DataProviderMock())
	}
	
	func test_title_isUserAccounts() {
		XCTAssertEqual(sut.title, "Account details")
	}
	
	func test_addTenPounds_whenValidResponse_shouldCallDidFetchAccounts() {
		XCTAssertTrue(mockViewController.calledFunctions.isEmpty)
		sut.addTenPounds(to: .mock())
		XCTAssertTrue(mockViewController.calledFunctions.contains("successfullyAdded(moneybox:)"))
	}
}

extension AccountDetailViewModelTests {
	class MockViewController: AccountDetailViewModelDelegate {
		var calledFunctions: [String] = []
		
		func successfullyAdded(moneybox: Double) {
			calledFunctions.append(#function)
		}
		
		func failedAddingMoney() {
			calledFunctions.append(#function)
		}

	}
}



