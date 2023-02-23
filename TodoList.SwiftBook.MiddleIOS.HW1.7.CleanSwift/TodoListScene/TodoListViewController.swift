//
//  TodoListViewController.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol TodoListDisplayLogic: AnyObject {
	func displayData(viewModel: TodoList.Model.ViewModel.ViewModelData)
}

class TodoListViewController: UIViewController, TodoListDisplayLogic {
	
	@IBOutlet weak var titleLabel: UILabel!
	var interactor: ITodoListInteractor?
	var router: (NSObjectProtocol & ITodoListRouter & ITodoListDataPassing)?
	
	// MARK: Object lifecycle
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		setup()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	// MARK: Setup
	
	private func setup() {
		let viewController			= self
		let interactor				= TodoListInteractor()
		let presenter				= TodoListPresenter()
		let router					= TodoListRouter()
		viewController.interactor	= interactor
		viewController.router		= router
		interactor.presenter		= presenter
		presenter.viewController	= viewController
		router.viewController		= viewController
		router.dataStore			= interactor
	}
	
	// MARK: Routing
	
	
	
	// MARK: View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		guard let title = router?.dataStore?.login else { return }
		titleLabel.text = "\(title)'s ToDoList"
	}
	
	func displayData(viewModel: TodoList.Model.ViewModel.ViewModelData) {
		
	}
	
}
