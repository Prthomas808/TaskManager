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
  private let itemsKey = "SavedTasks"
  
  private var items: [Task] = [] {
    didSet {
      saveTasks()
    }
  }
 
  // MARK: Lifecyle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    configureNavBar()
    configureCollectionView()
    loadTasks()
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
  
  private func saveTasks() {
    do {
      let data = try JSONEncoder().encode(items)
      UserDefaults.standard.set(data, forKey: itemsKey)
    } catch {
      print("Error encoding tasks: \(error)")
    }
  }
  
  private func loadTasks() {
    if let data = UserDefaults.standard.data(forKey: itemsKey) {
      do {
        items = try JSONDecoder().decode([Task].self, from: data)
      } catch {
        print("Error decoding tasks: \(error)")
      }
    }
  }
  
  private func deleteItem(at indexPath: IndexPath) {
      items.remove(at: indexPath.item)
      
      // Animate the deletion
      collectionView.performBatchUpdates({
          collectionView.deleteItems(at: [indexPath])
      }, completion: nil)
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
    cell.deleteCell = { [weak self] in
      self?.deleteItem(at: indexPath)
    }
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
