//
//  ReusableView.swift
//
//  Created by Pedro Thomas on 11/28/23.
//

import UIKit

class ReusableView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .systemBackground
    layer.cornerRadius = 20
    layer.borderWidth = 2
    layer.borderColor = UIColor.systemRed.cgColor
   
  }
  
}
