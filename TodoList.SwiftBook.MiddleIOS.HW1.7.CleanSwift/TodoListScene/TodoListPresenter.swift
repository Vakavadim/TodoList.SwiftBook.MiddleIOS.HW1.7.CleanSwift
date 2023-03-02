//
//  TodoListPresenter.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ITodoListPresenter {
	func presentData(response: TodoList.Model.Response.ResponseType)
}

class TodoListPresenter: ITodoListPresenter {
	weak var viewController: ITodoListView?
	private var sectionManager: ISectionForTaskManagerAdapter?
	
	func presentData(response: TodoList.Model.Response.ResponseType) {
		switch response {
		case .presentTasks(let loadTasksResponse):
			sectionManager = SectionForTaskManagerAdapter(taskManagerResponse: loadTasksResponse)
			let viewData = mapViewData(sectionManager: sectionManager!)
			
			viewController?.displayData(viewData: viewData)
		}
	}
	
	/// Preparing date data for string representation.
	/// - Parameter date: struct Date.
	/// - Returns: Date string in format "dd/MM/YY".
	private func dateString(date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.locale = Locale(identifier: "ru_RU")
		dateFormatter.dateFormat = "dd/MM/YY"
		dateFormatter.string(from: date)
		return dateFormatter.string(from: date)
	}
	
	private func mapViewData(sectionManager: ISectionForTaskManagerAdapter) -> TodoList.ViewData {
		var sections = [TodoList.ViewData.Section]()
		let todoListTitle = TodoList.ViewData.TodoListTitle(sectionManager.getTasksListTitle())
		for section in sectionManager.getSections() {
			let sectionData = TodoList.ViewData.Section(
				title: section.title,
				tasks: mapTasksData(tasks: sectionManager.getTasksForSection(section: section) )
			)
			
			sections.append(sectionData)
		}
		
		return TodoList.ViewData(todoListTitle: todoListTitle, tasksBySections: sections)
	}
	
	private func mapTasksData(tasks: [Task]) -> [TodoList.ViewData.Task] {
		tasks.map{ mapTaskData(task: $0) }
	}
	
	private func mapTaskData(task: Task) -> TodoList.ViewData.Task {
		if let task = task as? ImportantTask {
			let result = TodoList.ViewData.ImportantTask(
				name: task.title,
				isDone: task.completed,
				isOverdue: task.deadLine < Date(),
				deadLine: "Deadline: \(dateString(date: task.deadLine))",
				priority: "\(task.taskPriority)"
			)
			return .importantTask(result)
		} else {
			let result = TodoList.ViewData.RegularTask(
				name: task.title,
				isDone: task.completed
			)
			return .regularTask(result)
		}
	}
	
}
