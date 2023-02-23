//
//  LoginModels.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum LoginModels {
	
	enum Model {
		struct Request {
			var login: String
			var password: String
		}
		struct Response {
			var success: Bool
			var login: String
			var lastLoginDate: Date
		}
		struct ViewModel {
			var success: Bool
			var userName: String
			var lastLoginDate: String
		}
	}
	
}
