//
//  LoginViewController.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ILoginViewController: AnyObject {
	func render(viewModel: LoginModels.Model.ViewModel)
}

class LoginViewController: UIViewController, ILoginViewController {
	var interactor: ILoginInteractor?
	var router: (NSObjectProtocol & ILoginRouter & ILoginDataPassing)?
	
	@IBOutlet weak var textFieldLogin: UITextField!
	@IBOutlet weak var textFieldPass: UITextField!
	@IBAction func loginButtonPress(_ sender: Any) {
		if let login = textFieldLogin.text, let password = textFieldPass.text {
			let request = LoginModels.Model.Request(login: login, password: password)
			interactor?.login(request: request)
		}
	}
	
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
		let presenter				= LoginPresenter()
		let router					= LoginRouter()
		let worker					= LoginWorker()
		let interactor				= LoginInteractor(worker: worker, presenter: presenter)
		viewController.interactor	= interactor
		viewController.router		= router
		presenter.viewController	= viewController
		router.viewController		= viewController
		router.dataStore			= interactor
	}
	
	// MARK: Routing
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let scene = segue.identifier {
			let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
			if let router = router, router.responds(to: selector) {
				router.perform(selector, with: segue)
			}
		}
	}
	
	
	// MARK: View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	func render(viewModel: LoginModels.Model.ViewModel) {
		let alert: UIAlertController
		
		if viewModel.success {
			print("Go to task manager screen")
			performSegue(withIdentifier: "TodoList", sender: Any?.self)
		} else {
			alert = UIAlertController(
				title: "Error",
				message: "",
				preferredStyle: UIAlertController.Style.alert
			)
			let action = UIAlertAction(title: "Ok", style: .default)
			alert.addAction(action)
			present(alert, animated: true, completion: nil)
		}
	}
	
}
