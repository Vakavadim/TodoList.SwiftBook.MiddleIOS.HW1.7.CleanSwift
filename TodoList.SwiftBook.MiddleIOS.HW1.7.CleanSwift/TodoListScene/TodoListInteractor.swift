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

protocol TodoListDataStore {
	var login: String? { get set }
}

class TodoListInteractor: ITodoListInteractor, TodoListDataStore {
	var login: String?
	var presenter: ITodoListPresenter?
	var service: TodoListService?
	
	func makeRequest(request: TodoList.Model.Request.RequestType) {
		if service == nil {
			service = TodoListService()
		}
	}
	
}
