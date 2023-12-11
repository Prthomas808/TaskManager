//
//  ReusableTextfield.swift
//
//  Created by Pedro Thomas on 12/1/23.
//

import UIKit

class ReusableTextfield: UITextField {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(placeholder: String, keyboardType: UIKeyboardType, isSecure: Bool) {
    super.init(frame: .zero)
    self.placeholder = placeholder
    self.keyboardType = keyboardType
    self.isSecureTextEntry = isSecure
    configure()
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .secondarySystemBackground
    layer.cornerRadius = 8
    textColor = .label
    tintColor = .label
    
    returnKeyType = .done
    autocorrectionType = .no
    autocapitalizationType = .none
    
    leftViewMode = .always
    leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
    
  }

}
