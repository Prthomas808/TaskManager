//
//  ReusableLabel.swift
//
//  Created by Pedro Thomas on 12/1/23.
//

import UIKit

class ReusableLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(text: String?, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor, numberOfLines: Int ) {
    super.init(frame: .zero)
    self.text = text
    self.font = .systemFont(ofSize: fontSize, weight: weight)
    self.textColor = color
    self.numberOfLines = numberOfLines
    configure()
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
  }

}
