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
	var login: String
	var lastLoginDate: Date
}

protocol ILoginWorker {
	func login(login: String, password: String) -> LoginDTO
}

class LoginWorker: ILoginWorker {
	
	func login(login: String, password: String) -> LoginDTO {
		if login == "Admin" && password == "pa$$32!" {
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
	
