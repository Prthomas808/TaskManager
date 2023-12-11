//
//  ReusableAlert.swift
//
//  Created by Pedro Thomas on 11/28/23.
//

import UIKit

class ReusableAlert: UIViewController {
  
  let containerView = ReusableView()
  let alertTitleLabel = ReusableLabel(text: "Error", fontSize: 18, weight: .bold, color: .label, numberOfLines: 1)
  let alertMessageLabel = ReusableBodyLabel(title: "Alert Message", textColor: .secondaryLabel)
  let actionButton = ReusableButton(buttonTitle: "Ok", textColor: .systemGray5, buttonColor: .white)
  
  var alertTitle: String?
  var alertMessage: String?
  var buttonTitle: String?
  
  let padding: CGFloat = 20
  
  init(title: String, message: String, buttonTitle: String) {
    super.init(nibName: nil, bundle: nil)
    self.alertTitle = title
    self.alertMessage = message
    self.buttonTitle = buttonTitle
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    configureAlertProperties()
    configureAlertConstraints()
    
    // Button Target
    actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
  }
  
  @objc func dismissVC() {
    dismiss(animated: true)
  }
  
  private func configureAlertProperties() {
    view.addSubview(containerView)
    
    containerView.addSubview(alertTitleLabel)
    alertTitleLabel.text = alertTitle ?? "Something went wrong"
    
    containerView.addSubview(alertMessageLabel)
    alertMessageLabel.text = alertMessage ?? ""
    alertMessageLabel.numberOfLines = 4
    
    containerView.addSubview(actionButton)
    actionButton.setTitle(buttonTitle ?? "Okay", for: .normal)
  }
  
  private func configureAlertConstraints() {
    // Container view constraint
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo:  view.centerXAnchor),
      containerView.widthAnchor.constraint(equalToConstant: 280),
      containerView.heightAnchor.constraint(equalToConstant: 220)
    ])

    // Alert title constraint
    NSLayoutConstraint.activate([
      alertTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      alertTitleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      alertTitleLabel.heightAnchor.constraint(equalToConstant: 28)
    ])
    // Button constraint
    NSLayoutConstraint.activate([
      actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      actionButton.heightAnchor.constraint(equalToConstant: 44)
    ])

    // Alert message constraint
    NSLayoutConstraint.activate([
      alertMessageLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor, constant: 8),
      alertMessageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      alertMessageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      alertMessageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
    ])
  }
}
