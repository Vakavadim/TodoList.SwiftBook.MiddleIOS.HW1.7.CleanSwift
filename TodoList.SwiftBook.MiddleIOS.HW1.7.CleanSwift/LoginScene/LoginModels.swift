//
//  LoginModels.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum LoginModels {
	
	struct Login {
		let rawValue: String
		
		init(_ rawValue: String) {
			self.rawValue = rawValue
		}
	}

	struct Password {
		let rawValue: String
		
		init(_ rawValue: String) {
			self.rawValue = rawValue
		}
	}
	
	enum Model {
		struct Request {
			var login: Login
			var password: Password
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
