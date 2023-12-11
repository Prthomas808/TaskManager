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
  
  init(borderWidth: CGFloat, cornerRadius: CGFloat) {
    super.init(frame: .zero)
    self.layer.borderWidth = borderWidth
    self.layer.cornerRadius = cornerRadius
    configure()
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    //backgroundColor = .systemBackground
  }
  
}
