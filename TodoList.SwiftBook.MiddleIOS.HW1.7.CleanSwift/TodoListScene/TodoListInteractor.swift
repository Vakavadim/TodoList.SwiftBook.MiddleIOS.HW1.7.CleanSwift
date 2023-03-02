//
//  TodoListInteractor.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ITodoListInteractor {
	func makeRequest(request: TodoList.Model.Request.RequestType)
}

protocol ITodoListDataStore {
	var login: String? { get set }
}

class TodoListInteractor: ITodoListInteractor, ITodoListDataStore {
	var login: String?
	var presenter: ITodoListPresenter?
	var worker: TodoListWorker
	
	private var taskManager: ITaskManager!
	
	init(presenter: ITodoListPresenter, worker: TodoListWorker) {
		self.presenter = presenter
		self.worker = worker
	}
	
	func makeRequest(request: TodoList.Model.Request.RequestType) {
		switch request {
		case .loadTasks:
			guard let login = login else { return }
			guard let tasks = worker.fetchTasks(login: login) else { return }
			taskManager = OrderedTaskManager(taskManager: TaskManager())
			taskManager.addTasks(tasks: tasks)
			
			let presenterData = TodoList.TasksResponse(
				completedTasks: taskManager.getCompletedTasks(),
				uncomletedTasks: taskManager.getUnDoneTasks(),
				login: TodoList.Login(name: login))
			
			presenter?.presentData(response: .presentTasks(presenterData))
		case .didDoneButtonPressed(let indexPath):
			var tasks = [Task]()
			if indexPath.section == 0 {
				tasks = taskManager.getUnDoneTasks()
			} else {
				tasks = taskManager.getCompletedTasks()
			}
			let task = tasks[indexPath.row]
			taskManager.completeTask(task: task)
			
			guard let login = login else { return }
			let presenterData = TodoList.TasksResponse(
				completedTasks: taskManager.getCompletedTasks(),
				uncomletedTasks: taskManager.getUnDoneTasks(),
				login: TodoList.Login(name: login))
			
			presenter?.presentData(response: .presentTasks(presenterData))
		}
	}
	
}
