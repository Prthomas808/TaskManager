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
  private var collectionView: UICollectionView!
    
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
    let nav = UINavigationController(rootViewController: vc)
    present(nav, animated: true)
  }
  
  // MARK: Helping Functions
  private func configureNavBar() {
    title = "Task Manager 📝"
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddTask))
    navigationController?.navigationBar.tintColor = .label
  }
  
  private func configureCollectionView() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 10, height: 140)
    
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
    15
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.reusableID, for: indexPath) as? TaskCell else { return UICollectionViewCell() }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    navigationController?.pushViewController(AddTaskVC(), animated: true)
  }
}
