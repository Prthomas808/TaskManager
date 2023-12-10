//
//  UIViewController+Ext.swift
//  MessagingApp
//
//  Created by Pedro Thomas on 11/28/23.
//

import UIKit
import CoreLocation

extension UIViewController {
  func presentAlert(title: String, message: String, buttonTitle: String) {
    DispatchQueue.main.async {
      let alert = ReusableAlert(title: title, message: message, buttonTitle: buttonTitle)
      alert.modalPresentationStyle = .overFullScreen
      alert.modalTransitionStyle = .crossDissolve
      self.present(alert, animated: true)
    }
  }
}
