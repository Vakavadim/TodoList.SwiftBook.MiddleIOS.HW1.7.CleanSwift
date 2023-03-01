//
//  StorageManager.swift
//  TaskManager.HW4.SwiftBook.MiddleIOSDev
//
//  Created by Вадим Гамзаев on 11.02.2023.
//

import Foundation

protocol ITaskRepository {
	func getTasks(login: String) -> [Task]?
}

class TaskRepositoryStub: ITaskRepository {
	
	private var tasks: [String: [Task]] = [
		"Admin": [
		RegularTask(title: "Сut the grass", completed: true),
		RegularTask(title: "Take out the trash"),
		RegularTask(title: "Go to the hairdresser"),
		RegularTask(title: "Buy new goggles"),
		ImportantTask(title: "Buy a birthday present",
					 taskPriority: .medium),
		ImportantTask(title: "Submit the homework",
					 taskPriority: .hight),
		ImportantTask(title: "Buy cat food",
					 taskPriority: .hight),
		ImportantTask(title: "Download a new game",
					 taskPriority: .low)
		]
	]
	
	func getTasks(login: String) -> [Task]? {
		let tasks = tasks[login]
		return tasks
	}
}
