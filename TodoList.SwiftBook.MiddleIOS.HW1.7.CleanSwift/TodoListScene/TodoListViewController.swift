//
//  TodoListViewController.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ITodoListView: AnyObject {
	func displayData(viewData: TodoList.ViewData)
}

class TodoListViewController: UIViewController, ITodoListView {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var titleLabel: UILabel!
	private let heightForRow: CGFloat = 70
	private var viewData: TodoList.ViewData = TodoList.ViewData(
		todoListTitle: TodoList.ViewData.TodoListTitle(""),
		tasksBySections: []
	)
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
		let presenter				= TodoListPresenter()
		let router					= TodoListRouter()
		let repository				= TaskRepositoryStub()
		let worker					= TodoListWorker(reposotory: repository)
		let interactor				= TodoListInteractor(presenter: presenter, worker: worker)
		viewController.interactor	= interactor
		viewController.router		= router
		interactor.presenter		= presenter
		presenter.viewController	= viewController
		router.viewController		= viewController
		router.dataStore			= interactor
	}
	
	private func setupTableViewCell() {
		let nib = UINib(nibName: "TaskCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: TaskCell.indetifire)
	}
	
	// MARK: Routing
	
	
	
	// MARK: View lifecycle
	
	override func loadView() {
		super.loadView()
		setupTableViewCell()
		interactor?.makeRequest(request: .loadTasks)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		titleLabel.text = viewData.todoListTitle.rawValue
	}
	
	func displayData(viewData: TodoList.ViewData) {
		self.viewData = viewData
		
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		viewData.tasksBySections.count
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		viewData.tasksBySections[section].title
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let section = viewData.tasksBySections[section]
		return section.tasks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.indetifire, for: indexPath)
		guard let cell = cell as? TaskCell else { return UITableViewCell() }
		let tasks = viewData.tasksBySections[indexPath.section].tasks
		let taskData = tasks[indexPath.row]
		cell.taskData = taskData
		return cell
	}
	
	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let title = indexPath.section == 0 ? "Done" : "Undone"
		let done = UIContextualAction(style: .normal, title: title) { [unowned self] _, _, _ in
			self.interactor?.makeRequest(request: .didDoneButtonPressed(indexPath))

			DispatchQueue.main.async {
				tableView.reloadData()
			}
		}
		
		let swipe = UISwipeActionsConfiguration(actions: [done])
		swipe.performsFirstActionWithFullSwipe = false
		return swipe
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		self.heightForRow
	}
}
