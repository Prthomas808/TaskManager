//
//  AddTaskVC.swift
//  TaskManager
//
//  Created by Pedro Thomas on 12/10/23.
//

import UIKit

class AddTaskVC: UIViewController {

  // MARK: Properties
  private let toDoLabel = ReusableLabel(text: "TO DO ITEM", fontSize: 14, weight: .light, color: .secondaryLabel)
  private let toDoTextfield = ReusableTextfield(placeholder: "Enter Task", keyboardType: .asciiCapable, isSecure: false)
  
  private let notesLabel = ReusableLabel(text: "NOTES", fontSize: 14, weight: .light, color: .secondaryLabel)
  private let notesTextView = UITextView()
  
  private let DateLabel = ReusableLabel(text: "DUE DATE", fontSize: 14, weight: .light, color: .secondaryLabel)
  private let datePicker = UIDatePicker()
  
  // MARK: Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureNavBar()
    configureToDoProperties()
    configureNotesViewProperties()
    configureDatePickerProperties()
    configureKeyboardProperties()
  }
  
  // MARK: Objc Functions
  @objc func dismissVC() {
    let taskViewIsBeingPresented = presentingViewController is UINavigationController
    
    if taskViewIsBeingPresented {
      dismiss(animated: true)
    } else {
      navigationController?.popViewController(animated: true)
    }
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
  // MARK: Helping Functions
  
  private func configureNavBar() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
    navigationController?.navigationBar.tintColor = .systemRed
  }
  
  private func configureToDoProperties() {
    view.addSubview(toDoLabel)
    view.addSubview(toDoTextfield)
    
    NSLayoutConstraint.activate([
      toDoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      toDoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      toDoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      toDoTextfield.topAnchor.constraint(equalTo: toDoLabel.bottomAnchor, constant: 10),
      toDoTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      toDoTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      toDoTextfield.heightAnchor.constraint(equalToConstant: 45)
    ])
  }
  
  private func configureNotesViewProperties() {
    view.addSubview(notesLabel)
    view.addSubview(notesTextView)
    notesTextView.backgroundColor = .secondarySystemBackground
    notesTextView.layer.cornerRadius = 10
    notesTextView.returnKeyType = .done
    notesTextView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      notesLabel.topAnchor.constraint(equalTo: toDoTextfield.bottomAnchor, constant: 30),
      notesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      notesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      notesTextView.topAnchor.constraint(equalTo: notesLabel.bottomAnchor, constant: 10),
      notesTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      notesTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
      notesTextView.heightAnchor.constraint(equalToConstant: 200)
    ])
  }
  
  private func configureKeyboardProperties() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  private func configureDatePickerProperties() {
    view.addSubview(DateLabel)
    view.addSubview(datePicker)
    datePicker.translatesAutoresizingMaskIntoConstraints = false
    datePicker.preferredDatePickerStyle = .compact
    datePicker.tintColor = .systemRed
    
    NSLayoutConstraint.activate([
      DateLabel.topAnchor.constraint(equalTo: notesTextView.bottomAnchor, constant: 30),
      DateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      DateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      
      datePicker.topAnchor.constraint(equalTo: DateLabel.bottomAnchor, constant: 10),
      datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
      datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
    ])
  }
}
