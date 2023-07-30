//
//  TermsViewController.swift
//  Routing
//
//  Created by Sergei Semko on 7/30/23.
//

import UIKit

class TermsViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Terms and Agreements"
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    public func configure(with langCode: String) {
        self.langCode = langCode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(label)
        
        if let defaultTitle = label.text {
            let newTitle = defaultTitle + " - " + langCode
            label.text = newTitle
        }
    }
    
    private var langCode: String = ""

}

private extension TermsViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
