//
//  LoginViewController.swift
//  MoneyBox
//
//  Created by Zeynep Kara on 16.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
	@IBOutlet private weak var passwordTextField: UITextField!
	@IBOutlet private weak var usernameTextField: UITextField!
	
	var viewModel = LoginViewModel()
	
	@IBAction func loginButtonTapped(_ sender: Any) {
		guard let username = usernameTextField.text,
			  let password = passwordTextField.text
		else { return }
		viewModel.startLogin(
			with: username,
			password: password)
	}
	
}

extension LoginViewController: LoginViewModelDelegate {
	func userSuccessfullyLoggedIn() {
		
	}
	
	func userFailedToLogin(with error: Error) {
		let alertController = UIAlertController(
			title: "Login failed",
			message: error.localizedDescription,
			preferredStyle: .alert)
		present(alertController, animated: true)
	}
}
