//
//  TodoListPresenter.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ITodoListPresenter {
  func presentData(response: TodoList.Model.Response.ResponseType)
}

class TodoListPresenter: ITodoListPresenter {
  weak var viewController: TodoListDisplayLogic?
  
  func presentData(response: TodoList.Model.Response.ResponseType) {
  
  }
  
}
