//
//  SceneDelegate.swift
//  Hobbyloop
//
//  Created by Kim dohyun on 2023/03/22.
//

import UIKit

import KakaoSDKAuth
import RxKakaoSDKAuth
import RxKakaoSDKCommon
import NaverThirdPartyLogin


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    public var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = .init(windowScene: scene)
        let loginDIContainer = LoginDIContainer()
        window?.rootViewController = UINavigationController(rootViewController: loginDIContainer.makeViewController())
        window?.makeKeyAndVisible()
        
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            setOpenURLKakaoLoign(open: url)
            setOpenURLKakaoLoign(open: url)
        }
    }
}


private extension SceneDelegate {
    
    func setOpenURLKakaoLoign(open url: URL) {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            _ = AuthController.rx.handleOpenUrl(url: url)
        }
    }
    
    func setOpenURLNaverLogin(open url: URL) {
        NaverThirdPartyLoginConnection
            .getSharedInstance()
            .receiveAccessToken(url)
    }
}
