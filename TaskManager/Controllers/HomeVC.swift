//
//  HomeVC.swift
//  TaskManager
//
//  Created by Pedro Thomas on 12/10/23.
//

import UIKit

class HomeVC: UIViewController {

  // MARK: Properties
  private let TaskTable = UITableView()
    
  // MARK: Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureNavBar()
    configureTableView()
  }
  
  // MARK: Objc Functions
  @objc func presentAddTask() {
    let vc = AddTaskVC()
    let nav = UINavigationController(rootViewController: vc)
    present(nav, animated: true)
  }
  
  // MARK: Helping Functions
  private func configureNavBar() {
    title = "Task Manager 📝"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddTask))
    navigationController?.navigationBar.tintColor = .systemRed
  }
  
  private func configureTableView() {
    view.addSubview(TaskTable)
    TaskTable.delegate = self
    TaskTable.dataSource = self
    TaskTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    TaskTable.frame = view.bounds
  }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "Item \(indexPath.row + 1)"
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    navigationController?.pushViewController(AddTaskVC(), animated: true)
  }
}
