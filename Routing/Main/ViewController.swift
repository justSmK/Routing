//
//  ViewController.swift
//  Routing
//
//  Created by Sergei Semko on 7/30/23.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Constants {
        static var width: CGFloat = 100
        static var height: CGFloat = 50
    }
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .link
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .continuous
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var termsAndAgreementsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Terms and Agreements", for: .normal)
        button.tintColor = .link
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(termsAndAgreementsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var demoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Demo", for: .normal)
        button.backgroundColor = .link
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.layer.cornerCurve = .continuous
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(demoButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(loginButton)
        view.addSubview(termsAndAgreementsButton)
        view.addSubview(demoButton)
    }
    
    @objc
    private func loginButtonTapped(_ sender: UIButton) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }

    @objc
    private func termsAndAgreementsButtonTapped(_ sender: UIButton) {
        let termsViewController = TermsViewController()
        navigationController?.pushViewController(termsViewController, animated: true)
    }
    
    @objc
    private func demoButtonTapped(_ sender: UIButton) {
        let demoViewController = DemoViewController()
        demoViewController.modalPresentationStyle = .popover
        demoViewController.modalTransitionStyle = .flipHorizontal
        present(demoViewController, animated: true)
    }
}

private extension ViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            loginButton.heightAnchor.constraint(equalToConstant: Constants.height),
            loginButton.widthAnchor.constraint(equalToConstant: Constants.width),
            
            termsAndAgreementsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsAndAgreementsButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            termsAndAgreementsButton.heightAnchor.constraint(equalToConstant: Constants.height),

            demoButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            demoButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            demoButton.heightAnchor.constraint(equalToConstant: Constants.height),
            demoButton.widthAnchor.constraint(equalToConstant: Constants.width),
        ])
    }
}
