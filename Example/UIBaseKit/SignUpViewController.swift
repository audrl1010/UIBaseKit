//
//  SignUpViewController.swift
//  UIBaseKit_Example
//
//  Created by myung gi son on 2017. 11. 5..
//  Copyright © 2017년 CocoaPods. All rights reserved.
//

import UIKit
import UIBaseKit

class SignUpViewController: BaseViewController {
  
  // MARK: - UI
  
  var usernameLabel: UILabel = {
    $0.textColor = .black
    $0.textAlignment = .right
    $0.font = .boldSystemFont(ofSize: 16.0)
    $0.text = "Username"
    return $0
  }(UILabel())
  
  var usernameTextField: UITextField = {
    $0.borderStyle = .roundedRect
    $0.placeholder = "Input username"
    $0.textColor = .black
    $0.textAlignment = .left
    $0.font = .systemFont(ofSize: 14.0)
    return $0
  }(UITextField())
  
  var emailLabel: UILabel = {
    $0.textColor = .black
    $0.textAlignment = .right
    $0.font = .boldSystemFont(ofSize: 16.0)
    $0.text = "Email"
    return $0
  }(UILabel())
  
  var emailTextField: UITextField = {
    $0.borderStyle = .roundedRect
    $0.placeholder = "Input email."
    $0.textColor = .black
    $0.textAlignment = .left
    $0.font = .systemFont(ofSize: 14.0)
    return $0
  }(UITextField())
  
  var passwordLabel: UILabel = {
    $0.textColor = .black
    $0.textAlignment = .right
    $0.font = .boldSystemFont(ofSize: 16.0)
    $0.text = "password"
    return $0
  }(UILabel())
  
  var passwordTextField: UITextField = {
    $0.borderStyle = .roundedRect
    $0.placeholder = "Input password."
    $0.textColor = .black
    $0.textAlignment = .left
    $0.font = .systemFont(ofSize: 14.0)
    return $0
  }(UITextField())
  
  var signUpButton: UIButton = {
    $0.titleLabel?.font = .systemFont(ofSize: 18.0)
    $0.setTitle("Sign Up", for: .normal)
    return $0
  }(UIButton(type: .system))
  
  var containerView: UIView = {
    $0.backgroundColor = .clear
    return $0
  }(UIView())
  
  var keyboardAvoidView: UIView = {
    $0.backgroundColor = .clear
    return $0
  }(UIView())
  
  // MARK: - Properties
  
  var keyboardDismissTapGesture: UITapGestureRecognizer?
  
  // MARK: - Life Cycle
  
  deinit {
    removeKeyboardObservers()
  }
  
  /// After configure propertys for each view,
  /// return an array of views to add to the superview in desired order.
  override func setupViews() -> [CanBeSubview]? {
    // 1) configure views
    view.backgroundColor = .white
    registerKeyboardObservers()
    signUpButton.addTarget(self, action: #selector(signUpButtonDidTouch), for: .touchUpInside)
    
    
    // 2) return subviews
    /** 😍 viewController`s view hierarchy
       → keyboardAvoidView
          → containerView
              → usernameLabel
              → usernameTextField
              → emailLabel
              → emailTextField
              → passwordLabel
              → passwordTextField
       → signUpButton
     */
    let hierarchy = [
      keyboardAvoidView.addSubviews(
        containerView.addSubviews(
          usernameLabel,
          usernameTextField,
          emailLabel,
          emailTextField,
          passwordLabel,
          passwordTextField
        )
      ),
      signUpButton
    ]
    return hierarchy
  }
  
  /// Configure the constraints for each view.
  override func setupConstraints() {
    // 3) set constraints for each view added to superview.
    // 🤓Note: I set constraints for each view using my favorite `FluidAnchor` library.
    // https://github.com/audrl1010/FluidAnchor
    
    keyboardAvoidView.flu
      .leftAnchor(equalTo: view.leftAnchor)
      .topAnchor(equalTo: view.topAnchor)
      .rightAnchor(equalTo: view.rightAnchor)
      .bottomAnchor(equalTo: view.bottomAnchor)
    
    containerView.flu
      .topAnchor(equalTo: view.topAnchor, constant: 60)
      .leftAnchor(equalTo: view.leftAnchor, constant: 15)
      .rightAnchor(equalTo: view.rightAnchor, constant: -15)
      .heightAnchor(equalToConstant: 180)
    
    usernameLabel.flu
      .topAnchor(equalTo: containerView.topAnchor, constant: 10)
      .leftAnchor(equalTo: containerView.leftAnchor, constant: 10)
      .widthAnchor(equalToConstant: 80)
      .heightAnchor(equalToConstant: 40)
    
    usernameTextField.flu
      .topAnchor(equalTo: usernameLabel.topAnchor)
      .leftAnchor(equalTo: usernameLabel.rightAnchor, constant: 10)
      .widthAnchor(equalToConstant: 240)
      .heightAnchor(equalToConstant: 40)
    
    emailLabel.flu
      .topAnchor(equalTo: usernameLabel.bottomAnchor, constant: 10)
      .leftAnchor(equalTo: usernameLabel.leftAnchor)
      .widthAnchor(equalToConstant: 80)
      .heightAnchor(equalToConstant: 40)
    
    emailTextField.flu
      .topAnchor(equalTo: emailLabel.topAnchor)
      .leftAnchor(equalTo: emailLabel.rightAnchor, constant: 10)
      .widthAnchor(equalToConstant: 240)
      .heightAnchor(equalToConstant: 40)
    
    passwordLabel.flu
      .topAnchor(equalTo: emailLabel.bottomAnchor, constant: 10)
      .leftAnchor(equalTo: usernameLabel.leftAnchor)
      .widthAnchor(equalToConstant: 80)
      .heightAnchor(equalToConstant: 40)
    
    passwordTextField.flu
      .topAnchor(equalTo: passwordLabel.topAnchor)
      .leftAnchor(equalTo: passwordLabel.rightAnchor, constant: 10)
      .widthAnchor(equalToConstant: 240)
      .heightAnchor(equalToConstant: 40)
    
    signUpButton.flu
      .topAnchor(equalTo: containerView.bottomAnchor, constant: 20)
      .centerXAnchor(equalTo: view.centerXAnchor)
  }
  
  // MARK: - Action
  
  @objc func signUpButtonDidTouch() {
    print("username: \(usernameTextField.text ?? "")")
    print("email: \(emailTextField.text ?? "")")
    print("password: \(passwordTextField.text ?? "")")
  }
}

// MARK: - KeyboardObservable

protocol keyboardDismissableByViewTouch {
  var keyboardDismissTapGesture: UITapGestureRecognizer? { get set }
  
  func adjustKeyboardDismissTapGesture(isKeyboardVisible: Bool)
  func dismissKeyboard()
}

protocol KeyboardObservable {
  func registerKeyboardObservers()
  func removeKeyboardObservers()
  func keyboardWillShow(_ notification: Notification)
  func keyboardWillHide(_ notification: Notification)
}

// MARK: - KeyboardObservable
extension SignUpViewController: KeyboardObservable {
  
  func registerKeyboardObservers() {
    _ = {
      $0.addObserver(
        self,
        selector: #selector(keyboardWillHide(_:)),
        name: .UIKeyboardWillHide,
        object: nil
      )
      $0.addObserver(
        self,
        selector: #selector(keyboardWillShow(_:)),
        name: .UIKeyboardWillShow,
        object: nil
      )
    }(NotificationCenter.default)
  }
  
  func removeKeyboardObservers() {
    NotificationCenter.default.removeObserver(self)
  }
  
  @objc func keyboardWillShow(_ notification: Notification) {
    adjustKeyboardDismissTapGesture(isKeyboardVisible: true)
  }
  
  @objc func keyboardWillHide(_ notification: Notification) {
    adjustKeyboardDismissTapGesture(isKeyboardVisible: false)
  }
}

// MARK: - keyboardDismissableByViewTouch

extension SignUpViewController: keyboardDismissableByViewTouch {
  
  func adjustKeyboardDismissTapGesture(isKeyboardVisible: Bool) {
    if isKeyboardVisible {
      if keyboardDismissTapGesture == nil {
        keyboardDismissTapGesture = UITapGestureRecognizer(
          target: self,
          action: #selector(dismissKeyboard)
        )
        keyboardAvoidView.addGestureRecognizer(keyboardDismissTapGesture!)
      }
    }
    else {
      if keyboardDismissTapGesture != nil {
        keyboardAvoidView.removeGestureRecognizer(keyboardDismissTapGesture!)
        keyboardDismissTapGesture = nil
      }
    }
  }
  
  @objc func dismissKeyboard() {
    usernameTextField.resignFirstResponder()
    emailTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
  }
}
