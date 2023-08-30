//
//  Double+Currency.swift
//  MoneyBox
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

import Foundation

extension Double {
	var asGBPCurrency: String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.locale = Locale(identifier: "en_GB")

		let formattedString = formatter.string(from: self as NSNumber)
		return formattedString ?? ""
	}
}
