//
//  TodoListModels.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum TodoList {
	 
	struct ViewData {
		struct TodoListTitle {
			let rawValue: String
			
			init(_ rawValue: String) {
				self.rawValue = rawValue
			}
		}
		
		struct RegularTask {
			let name: String
			let isDone: Bool
		}
		
		struct ImportantTask {
			let name: String
			let isDone: Bool
			let isOverdue: Bool
			let deadLine: String
			let priority: String
		}
		
		enum Task {
			case regularTask(RegularTask)
			case importantTask(ImportantTask)
		}
		
		struct Section {
			let title: String
			let tasks: [Task]
		}
		
		let todoListTitle: TodoListTitle
		let tasksBySections: [Section]
	}
	
	struct Login {
		var name: String
	}
	
	struct TasksResponse {
		let completedTasks: [Task]
		let uncomletedTasks: [Task]
		let login: Login
	}
	
	enum Model {
		struct Request {
			enum RequestType {
				case loadTasks
				case didDoneButtonPressed(IndexPath)
			}
		}
		struct Response {
			enum ResponseType {
				case presentTasks(TasksResponse)
			}
		}
		struct ViewModel {
			enum ViewModelData {
				case displayTasks(TodoList.ViewData)
			}
		}
	}
}
