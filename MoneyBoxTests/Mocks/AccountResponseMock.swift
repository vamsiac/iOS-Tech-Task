//
//  AccountResponseMock.swift
//  MoneyBoxTests
//
//  Created by Vamsi Anguluru on 30/08/2023.
//

@testable import Networking

extension AccountResponse {
	static func mock(
		totalPlanValue: Double = 0.0,
		productResponse: [ProductResponse] = [],
		accounts: [Account]
	) -> AccountResponse {
		AccountResponse(
			moneyboxEndOfTaxYear: "",
			totalPlanValue: totalPlanValue,
			totalEarnings: 0,
		totalContributionsNet: 0,
			totalEarningsAsPercentage: 0,
			productResponses: productResponse,
			accounts: accounts)
	}
}

extension Account {
	static func mock(
		wrapperId: String
	) -> Account {
		return Account(
			type: "",
			name: "",
			deepLinkIdentifier: "",
			wrapper: .mock(wrapperId: wrapperId),
			milestone: nil,
			hasCollections: nil)
	}
}

extension Wrapper {
	static func mock(
		wrapperId: String
	) -> Wrapper {
		return Wrapper(
			id: wrapperId,
			definitionGlobalID: nil,
			totalValue: nil,
			totalContributions: nil,
			earningsNet: nil,
			earningsAsPercentage: nil,
			returns: nil)
	}
}

extension ProductResponse {
	static func mock() -> ProductResponse {
		return ProductResponse(
			id: 1,
			assetBoxGlobalID: nil,
			planValue: nil,
			moneybox: nil,
			subscriptionAmount: nil,
			totalFees: nil,
			isSelected: nil,
			isFavourite: nil,
			collectionDayMessage: nil,
			wrapperID: nil,
			isCashBox: nil,
			pendingInstantBankTransferAmount: nil,
			assetBox: nil,
			product: nil,
			investorAccount: nil,
			personalisation: nil,
			contributions: nil,
			moneyboxCircle: nil,
			isSwitchVisible: nil,
			state: nil,
			dateCreated: nil)
	}
}
