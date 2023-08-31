//
//  Double+CurrencyTests.swift
//  MoneyBoxTests
//
//  Created by Vamsi Anguluru on 31/08/2023.
//

import XCTest
@testable import MoneyBox

class DoubleCurrencyTests: XCTestCase {
	func test_asGBPCurrency_whenDoubleWithoutFraction_returnsValidCurrencyInGBPFormat() {
		let currency: Double = 10
		XCTAssertEqual(currency.asGBPCurrency, "£10.00")
	}
	
	func test_asGBPCurrency_whenDoubleWithLargeFraction_returnsValidCurrencyInGBPFormat() {
		let currency: Double = 123.1231231234
		XCTAssertEqual(currency.asGBPCurrency, "£123.12")
	}
	
	func test_asGBPCurrency_whenDoubleWithOneFraction_returnsValidCurrencyInGBPFormat() {
		let currency: Double = 123.1
		XCTAssertEqual(currency.asGBPCurrency, "£123.10")
	}
	
	func test_asGBPCurrency_whenDoubleWithZeroFractions_returnsValidCurrencyInGBPFormat() {
		let currency: Double = 123.00
		XCTAssertEqual(currency.asGBPCurrency, "£123.00")
	}
}
