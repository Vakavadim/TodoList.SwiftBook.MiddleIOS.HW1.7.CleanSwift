//
//  LoginRouter.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

@objc protocol ILoginRouter {
	func routeToTodoList(segue: UIStoryboardSegue?)
}

protocol ILoginDataPassing {
	var dataStore: ILoginDataStore? { get }
}

class LoginRouter: NSObject, ILoginRouter, ILoginDataPassing {
	weak var viewController: LoginViewController?
	var dataStore: ILoginDataStore?
	
	// MARK: Routing
	func routeToTodoList(segue: UIStoryboardSegue?) {
		if let segue = segue {
			let destinationVC = segue.destination as! TodoListViewController
			var destinationDS = destinationVC.router!.dataStore!
			passDataToTodoList(source: dataStore!, destination: &destinationDS)
		} else {
			let storyboard = UIStoryboard(name: "TodoListViewController", bundle: nil)
			let desinationVC = storyboard.instantiateViewController(withIdentifier: "TodoListViewController") as! TodoListViewController
			navigateToToTodoList(source: viewController!, destination: desinationVC)
		}
	}
	
	// MARK: Navigation
	func navigateToToTodoList(source: LoginViewController, destination: TodoListViewController) {
		source.show(destination, sender: nil)
	}
	
	// MARK: Passing data
	func passDataToTodoList(source: ILoginDataStore, destination: inout ITodoListDataStore) {
		destination.login = source.login
	}
}
