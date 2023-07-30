//
//  MainRouter.swift
//  Routing
//
//  Created by Sergei Semko on 7/30/23.
//

import UIKit.UIViewController

protocol MainRouter {
    func showDemo(from viewController: UIViewController, shouldDismissAnimated: Bool)
    func showLogin(from viewController: UIViewController, authData: AuthData)
    func showTerms(from viewController: UIViewController, langData: String)
}

// MARK: - MainRouter

extension Router: MainRouter {
    func showDemo(from viewController: UIViewController, shouldDismissAnimated: Bool) {
        let demoViewController = DemoViewController()
        demoViewController.configure(with: shouldDismissAnimated)
        demoViewController.modalPresentationStyle = .popover
        demoViewController.modalTransitionStyle = .flipHorizontal
        viewController.present(demoViewController, animated: true)
    }
    
    func showLogin(from viewController: UIViewController, authData: AuthData) {
        let loginViewController = LoginViewController()
        loginViewController.configure(authData: authData)
        viewController.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    func showTerms(from viewController: UIViewController, langData: String) {
        let termsViewController = TermsViewController()
        termsViewController.configure(with: langData)
        viewController.navigationController?.pushViewController(termsViewController, animated: true)
    }
}
