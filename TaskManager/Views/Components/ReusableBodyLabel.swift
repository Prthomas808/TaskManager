//
//  ReusableBodyLaebl.swift
//
//  Created by Pedro Thomas on 11/28/23.
//

import UIKit

class ReusableBodyLabel: UILabel {

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  init(title: String, textColor: UIColor) {
    super.init(frame: .zero)
    self.text = title
    self.textColor = textColor
    configure()
  }
  
  private func configure() {
    translatesAutoresizingMaskIntoConstraints = false
    textAlignment = .center
    font = .preferredFont(forTextStyle: .body)
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.75
    lineBreakMode = .byWordWrapping
  }

}
