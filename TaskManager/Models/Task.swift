//
//  Task.swift
//  TaskManager
//
//  Created by Pedro Thomas on 12/11/23.
//

import Foundation

struct Task {
  let taskTitle: String
  let taskNotes: String
  
  init(taskTitle: String, taskNotes: String) {
          self.taskTitle = taskTitle
          self.taskNotes = taskNotes
      }
}
