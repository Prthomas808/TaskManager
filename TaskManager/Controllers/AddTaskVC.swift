//
//  AddTaskVC.swift
//  TaskManager
//
//  Created by Pedro Thomas on 12/10/23.
//

import UIKit

protocol AddTaskDelegate: AnyObject {
  func didSaveTask(title: String, notes: String)
}

class AddTaskVC: UIViewController {
  
  // MARK: Properties
  private let toDoLabel = ReusableLabel(text: "TO DO ITEM", fontSize: 14, weight: .light, color: .secondaryLabel, numberOfLines: 1)
  let toDoTextfield = ReusableTextfield(placeholder: "Enter Task", keyboardType: .asciiCapable, isSecure: false)
  
  private let notesLabel = ReusableLabel(text: "NOTES", fontSize: 14, weight: .light, color: .secondaryLabel, numberOfLines: 100)
  let notesTextView = UITextView()
  
  var taskTitle: String?
  var taskNotes: String?
  
  weak var delegate: AddTaskDelegate?
  
  // MARK: Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureNavBar()
    configureToDoProperties()
    configureNotesViewProperties()
    configureKeyboardProperties()
    
    if let title = taskTitle, let notes = taskNotes {
      toDoTextfield.text = title
      notesTextView.text = notes
    }
  }
  
  // MARK: Objc Functions
  @objc func cancelTapped() {
    let taskViewIsBeingPresented = presentingViewController is UINavigationController
    
    if taskViewIsBeingPresented {
      dismiss(animated: true)
    } else {
      navigationController?.popViewController(animated: true)
    }
  }
  
  @objc func saveTapped() {
    guard let textfield = toDoTextfield.text else { return }
    guard let notes = notesTextView.text else { return }
    
    if textfield.isEmpty {
      presentAlert(title: "Add A Task", message: "Please make sure you add a task", buttonTitle: "Okay")
      return
    } else {
      delegate?.didSaveTask(title: textfield, notes: notes)
      dismiss(animated: true)
    }
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  
  // MARK: Helping Functions
  
  private func configureNavBar() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
    navigationController?.navigationBar.tintColor = .label
    navigationController?.navigationBar.prefersLargeTitles = false
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
    notesTextView.tintColor = .label
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
}
