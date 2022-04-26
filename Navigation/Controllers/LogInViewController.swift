//
//  LogInViewController.swift
//  Navigation
//
//  Created by Александр on 26.02.2022.
//

import UIKit

final class LogInViewController: UIViewController {

    

    private var login = "login@mail.ru"
    private var password = "pass"

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var labelAlert: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.alpha = 0
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.red.cgColor
        label.backgroundColor = .yellow
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var loginPasswordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "Email or phone"
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.font = .systemFont(ofSize: 16)
        textField.placeholder = "Password"
        textField.layer.borderWidth = 0.5
        textField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.configureSubviews()
        self.setupConstraints()
        self.setupLabelAlert()
        self.navigationController?.navigationBar.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        addTapGestureToHideKeyboard()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }

    private func configureSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.logInButton)
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.loginPasswordStackView)
        self.loginPasswordStackView.addArrangedSubview(self.loginTextField)
        self.loginPasswordStackView.addArrangedSubview(self.passwordTextField)
    }
    private func setupLabelAlert() {
        self.contentView.addSubview(self.labelAlert)

        NSLayoutConstraint.activate([
            labelAlert.topAnchor.constraint(equalTo: self.logInButton.bottomAnchor, constant: 20),
            labelAlert.leadingAnchor.constraint(equalTo: self.loginPasswordStackView.leadingAnchor),
            labelAlert.trailingAnchor.constraint(equalTo: self.loginPasswordStackView.trailingAnchor),
            labelAlert.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupConstraints() {



        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor),

            self.logoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 100),

            self.loginPasswordStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.loginPasswordStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.loginPasswordStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.loginPasswordStackView.heightAnchor.constraint(equalToConstant: 100),

            self.logInButton.topAnchor.constraint(equalTo: self.loginPasswordStackView.bottomAnchor, constant: 16),
            self.logInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.logInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func buttonClicked() {
        let profileViewController = ProfileViewController()

        if self.passwordTextField.text?.count ?? 0 < password.count {
            labelAlert.alpha = 1
            labelAlert.text = "Количество символов пароля меньше верного"

        } else if self.passwordTextField.text?.count ?? 0 > password.count {
            labelAlert.alpha = 1
            labelAlert.text = "Количество символов пароля больше верного"

        } else {
            labelAlert.alpha = 0
        }

        self.passwordTextField.backgroundColor = .systemGray6
        self.loginTextField.backgroundColor = .systemGray6
        if self.loginTextField.text == "" && self.passwordTextField.text != "" {
            self.loginTextField.backgroundColor = .red
        } else if self.loginTextField.text != "" && self.passwordTextField.text == "" {
            self.passwordTextField.backgroundColor = .red

        } else if self.loginTextField.text == "" && self.passwordTextField.text == "" {
            self.passwordTextField.backgroundColor = .red
            self.loginTextField.backgroundColor = .red
        }

        if self.loginTextField.text == login && self.passwordTextField.text == password {
            navigationController?.pushViewController(profileViewController, animated: true)
            
        } else if self.loginTextField.text != login && self.passwordTextField.text != password {
            let alertController = UIAlertController(title: "Access denied!",
                                                    message: "You didn't write correct password and login!",
                                                    preferredStyle: .alert)

            let actionOK = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: {(action:UIAlertAction!) in
                print("OK Was pressed!")
            })

            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: {(action:UIAlertAction!) in
                print("Cancel was pressed!")
            })

            alertController.addAction(actionOK)
            alertController.addAction(actionCancel)

            self.present(alertController, animated: true, completion: nil)
        } else if self.loginTextField.text == login && self.passwordTextField.text != password {
            let alertController = UIAlertController(title: "Access denied!",
                                                    message: "You didn't write correct password!",
                                                    preferredStyle: .alert)

            let actionOK = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: {(action:UIAlertAction!) in
                print("OK Was pressed!")
            })

            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: {(action:UIAlertAction!) in
                print("Cancel was pressed!")
            })

            alertController.addAction(actionOK)
            alertController.addAction(actionCancel)

            self.present(alertController, animated: true, completion: nil)

        } else if self.loginTextField.text != login && self.passwordTextField.text == password {
            let alertController = UIAlertController(title: "Access denied!",
                                                    message: "You didn't write correct login!",
                                                    preferredStyle: .alert)

            let actionOK = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: {(action:UIAlertAction!) in
                print("OK Was pressed!")
            })

            let actionCancel = UIAlertAction(title: "Cancel",
                                             style: .cancel,
                                             handler: {(action:UIAlertAction!) in
                print("Cancel was pressed!")
            })

            alertController.addAction(actionOK)
            alertController.addAction(actionCancel)

            self.present(alertController, animated: true, completion: nil)

        }
    }

    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let heightOfContent = loginPasswordStackView.bounds.height + logInButton.bounds.height + logInButton.bounds.height + 256
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)

            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                let frame = self.view.safeAreaLayoutGuide.layoutFrame
                let contentOffset: CGPoint = notification.name == UIResponder.keyboardWillHideNotification ? .zero: CGPoint(x: 0, y: heightOfContent - keyboardHeight)
                if heightOfContent + keyboardHeight >= frame.height {
                    self.scrollView.contentOffset = contentOffset
                }
            }
        }
    }

    @objc private func kbdHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.loginTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        return true
    }
}

extension LogInViewController: UITextFieldDelegate {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}


