//
//  LoginResponse.swift
//  MoneyBox
//
//  Created by Zeynep Kara on 16.01.2022.
//

import Foundation

// MARK: - LoginResponse
public struct LoginResponse: Decodable {
    let session: Session
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case session = "Session"
        case user = "User"
    }
    
    struct Session: Decodable {
        let bearerToken: String
        
        enum CodingKeys: String, CodingKey {
            case bearerToken = "BearerToken"
        }
    }
    
    // MARK: - User
    public struct User: Codable {
        public let firstName: String?
        public let lastName: String?
        
        enum CodingKeys: String, CodingKey {
            case firstName = "FirstName"
            case lastName = "LastName"
        }
    }
}
