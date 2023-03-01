//
//  TodoListRouter.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ITodoListRouter {
	
}

protocol ITodoListDataPassing {
	var dataStore: ITodoListDataStore? { get }
}

class TodoListRouter: NSObject, ITodoListRouter, ITodoListDataPassing {
	
	var dataStore: ITodoListDataStore?
	weak var viewController: TodoListViewController?
	
	// MARK: Routing
	
}
