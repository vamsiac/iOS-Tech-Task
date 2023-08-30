//
//  LoginViewModelTests.swift
//  MoneyBoxTests
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import XCTest
import Networking
@testable import MoneyBox

class LoginViewModelTests: XCTestCase {
	
	var sut: LoginViewModel!
	var mockViewController = MockViewController()
	
	override func setUp() {
		super.setUp()
		sut = LoginViewModel(
			delegate: mockViewController,
			dataProvider: DataProviderMock())
		sut.delegate = mockViewController
	}
	
	func test_startLogin_whenValidResponse_shouldCallUserSuccessfullyLoggedIn() {
		XCTAssertTrue(mockViewController.calledFunctions.isEmpty)
		sut.startLogin(with: "username", password: "password")
		XCTAssertTrue(mockViewController.calledFunctions.contains("successfullyLoggedIn(with:)"))
	}
}

extension LoginViewModelTests {
	class MockViewController: LoginViewModelDelegate {
		var calledFunctions: [String] = []
		
		func successfullyLoggedIn(with user: LoginResponse.User) {
			calledFunctions.append(#function)
		}
		
		func userFailedToLogin(with error: Error) {
			calledFunctions.append(#function)
		}
	}
}

