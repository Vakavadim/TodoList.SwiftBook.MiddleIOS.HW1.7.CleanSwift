//
//  TodoListModels.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum TodoList {
	
	enum Model {
		struct Request {
			enum RequestType {
				case getTasks
			}
		}
		struct Response {
			enum ResponseType {
				case presentTasks(ITaskManager)
			}
		}
		struct ViewModel {
			enum ViewModelData {
				case displayTasks(MainModel.ViewData)
			}
		}
	}
	
}

enum MainModel {
	struct ViewData {
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
		
		let tasksBySections: [Section]
	}
}
