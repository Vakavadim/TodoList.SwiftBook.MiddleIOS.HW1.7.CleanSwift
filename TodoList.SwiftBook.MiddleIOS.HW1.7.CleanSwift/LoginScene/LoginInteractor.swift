//
//  LoginInteractor.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LoginDataStore {
	var login: String? { get set }
}

protocol ILoginInteractor {
	func login(request: LoginModels.Model.Request)
}

class LoginInteractor: ILoginInteractor, LoginDataStore {
	var login: String?
	
	private var worker: ILoginWorker
	private var presenter: ILoginPresenter?
	
	init(worker: ILoginWorker, presenter: ILoginPresenter) {
		self.worker = worker
		self.presenter = presenter
	}
	
	func login(request: LoginModels.Model.Request) {
		let result  = worker.login(login: request.login, password: request.password)
		login = result.login
		
		let response = LoginModels.Model.Response(
			success: result.success,
			login: result.login,
			lastLoginDate: result.lastLoginDate
		)
		
		presenter?.present(response: response)
	}
}
