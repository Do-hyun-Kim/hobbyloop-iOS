//
//  AccountRouter.swift
//  HPNetwork
//
//  Created by Kim dohyun on 2023/06/02.
//

import Foundation

import Alamofire
import HPCommon

public enum AccountRouter {
    case getNaverUserInfo
    case getAccessToken(String)
}



extension AccountRouter: Router {
    
    public var baseURL: String {
        switch self {
        case .getNaverUserInfo:
            return "https://openapi.naver.com"
        case .getAccessToken:
            return "http://13.125.114.152:8080"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .getNaverUserInfo:
            return .get
        case .getAccessToken:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .getNaverUserInfo:
            return "/v1/nid/me"
        case .getAccessToken:
            return "/login/oauth2/kakao"
        }
        
    }
    
    public var headers: HTTPHeaders {

        switch self {
        case .getNaverUserInfo:
            return [:]
            
        case let .getAccessToken(accessToken):
            return [
                "Authorization":"\(accessToken)",
                "Accept": "*/*"
            ]

        }
    }
    
    
    
    
}
