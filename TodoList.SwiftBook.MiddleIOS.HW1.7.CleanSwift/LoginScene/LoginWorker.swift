//
//  LoginWorker.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

public struct LoginDTO {
	var success: Bool
	var login: LoginModels.Login
	var lastLoginDate: Date
}

protocol ILoginWorker {
	func login(login: LoginModels.Login, password: LoginModels.Password) -> LoginDTO
}

class LoginWorker: ILoginWorker {
	
	func login(login: LoginModels.Login, password: LoginModels.Password) -> LoginDTO {
		if login.rawValue == "Admin" && password.rawValue == "pa$$32!" {
			return LoginDTO(
				success: true,
				login: login,
				lastLoginDate: Date()
			)
		} else {
				return LoginDTO(
					success: false,
					login: login,
					lastLoginDate: Date())
			}
		}
}
	
