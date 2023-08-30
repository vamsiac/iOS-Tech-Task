//
//  LoginViewController.swift
//  MoneyBox
//
//  Created by Zeynep Kara on 16.01.2022.
//

import UIKit
import Networking

class LoginViewController: UIViewController {
	// MARK: - Properties -
	
	// MARK: Outlets
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet private weak var usernameTextField: UITextField!
	
	// MARK: Internal
	var viewModel: LoginViewModel!
	
	// MARK: - Functions -
	// MARK: Overrides

	@IBAction func loginButtonTapped(_ sender: Any) {
		guard let username = usernameTextField.text,
			  let password = passwordTextField.text
		else { return }
		viewModel = LoginViewModel(delegate: self)
		viewModel.startLogin(
			with: username,
			password: password)
	}
	
}

// MARK: - LoginViewModelDelegate -

extension LoginViewController: LoginViewModelDelegate {
	func successfullyLoggedIn(with user: LoginResponse.User) {
		let storyboard = UIStoryboard(name: "Login", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "AccountsViewController") as! AccountsViewController
		viewController.firstName = user.firstName
		self.navigationController?.pushViewController(viewController, animated: true)
	}
	
	func userFailedToLogin(with error: Error) {
		let alertController = UIAlertController(
			title: "Login failed",
			message: error.localizedDescription,
			preferredStyle: .alert)
		present(alertController, animated: true)
	}
}
