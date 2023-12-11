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
  var collectionView: UICollectionView!
  private var items: [Task] = []
  
  // MARK: Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureNavBar()
    configureCollectionView()
  }
  
  // MARK: Objc Functions
  @objc func presentAddTask() {
    let vc = AddTaskVC()
    vc.delegate = self
    let nav = UINavigationController(rootViewController: vc)
    present(nav, animated: true)
  }
  
  // MARK: Helping Functions
  private func configureNavBar() {
    title = "Task Manager 📝"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddTask))
    navigationController?.navigationBar.tintColor = .label
  }
  
  private func configureCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 10, height: 120)
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.addSubview(collectionView)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.register(TaskCell.self, forCellWithReuseIdentifier: TaskCell.reusableID)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionView.frame = view.bounds
  }
  
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.reusableID, for: indexPath) as? TaskCell else { return UICollectionViewCell() }
    let task = items[indexPath.row]
    cell.taskTitle.text = task.taskTitle
    cell.taskNotes.text = task.taskNotes
    return cell
  }
}

extension HomeVC: AddTaskDelegate {
  func didSaveTask(title: String, notes: String) {
    let newTask = Task(taskTitle: title, taskNotes: notes)
    items.append(newTask)
    collectionView.reloadData()
  }
}
