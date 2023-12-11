//
//  TaskCell.swift
//  TaskManager
//
//  Created by Pedro Thomas on 12/11/23.
//

import UIKit

class TaskCell: UICollectionViewCell {
    
  // MARK: Properties
  static var reusableID = "TaskCell"
  
  private let containerView = ReusableView(borderWidth: 0, cornerRadius: 20)
  private let containerViewColor: [UIColor] = [.systemRed, .systemBrown, .systemIndigo, .systemBlue, .systemTeal, .systemOrange, .systemTeal, .systemPurple, .systemGreen]
  
  private let taskSystemImage = ReusableSystemImage(systemImage: "circle.inset.filled", preferMultiColor: false, color: .white)
  let taskTitle = ReusableLabel(text: "Dentist Appointment".capitalized, fontSize: 18, weight: .semibold, color: .white, numberOfLines: 1)
  let taskNotes = ReusableLabel(text: "Make sure that you floss and make sure you bring your insurance card!", fontSize: 14, weight: .light, color: .white, numberOfLines: 2)
  private let deleteButton = UIButton()
  
  // MARK: Lifecyle
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureContainerView()
    configurePropertiesInContainerView()
    configureConstraintsInContainerView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Objc Functions
  
  // MARK: Helping Functions
  private func configureContainerView() {
    contentView.addSubview(containerView)
    containerView.backgroundColor = containerViewColor.randomElement()
    
    NSLayoutConstraint.activate([
      containerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      containerView.heightAnchor.constraint(equalToConstant: 100),
      containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 10)
    ])
  }
  
  private func configurePropertiesInContainerView() {
    containerView.addSubview(taskSystemImage)
    containerView.addSubview(taskTitle)
    containerView.addSubview(taskNotes)
    taskNotes.lineBreakMode = .byTruncatingTail
    
    containerView.addSubview(deleteButton)
    deleteButton.translatesAutoresizingMaskIntoConstraints = false
    deleteButton.setImage(UIImage(systemName: "trash"), for: .normal)
    deleteButton.tintColor = .white
  }
  
  private func configureConstraintsInContainerView() {
    NSLayoutConstraint.activate([
      taskSystemImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
      taskSystemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
      taskSystemImage.heightAnchor.constraint(equalToConstant: 30),
      taskSystemImage.widthAnchor.constraint(equalToConstant: 30),
      
      taskTitle.centerYAnchor.constraint(equalTo: taskSystemImage.centerYAnchor),
      taskTitle.leadingAnchor.constraint(equalTo: taskSystemImage.trailingAnchor, constant: 10),
      taskTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
      
      taskNotes.topAnchor.constraint(equalTo: taskTitle.bottomAnchor, constant: 5),
      taskNotes.leadingAnchor.constraint(equalTo: taskSystemImage.trailingAnchor, constant: 10),
      taskNotes.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
      
      deleteButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      deleteButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
      deleteButton.heightAnchor.constraint(equalToConstant: 20),
      deleteButton.widthAnchor.constraint(equalToConstant: 20),
    ])
  }
}
