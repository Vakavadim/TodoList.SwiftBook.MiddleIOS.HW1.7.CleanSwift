//
//  TodoListWorker.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ITodoListWorker {
	func fetchTasks(login: String) -> [Task]?
}

class TodoListWorker: ITodoListWorker {
	var reposotory: ITaskRepository
	
	init(reposotory: ITaskRepository) {
		self.reposotory = reposotory
	}
	
	func fetchTasks(login: String) -> [Task]? {
		reposotory.getTasks(login: login)
	}
}
