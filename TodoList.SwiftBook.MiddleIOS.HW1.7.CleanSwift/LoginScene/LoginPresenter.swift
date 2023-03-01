//
//  LoginPresenter.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ILoginPresenter {
	func present(response: LoginModels.Model.Response)
}

class LoginPresenter: ILoginPresenter {
	weak var viewController: ILoginViewController?
	
	func present(response: LoginModels.Model.Response) {
		let viewModel = LoginModels.Model.ViewModel(
			success: response.success,
			userName: response.login,
			lastLoginDate: "\(response.lastLoginDate)"
		)
		
		viewController?.render(viewModel: viewModel)
	}
	
}
