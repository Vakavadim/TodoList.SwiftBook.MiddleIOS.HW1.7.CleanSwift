//
//  SceneDelegate.swift
//  TodoList.SwiftBook.MiddleIOS.HW1.7.CleanSwift
//
//  Created by Вадим Гамзаев on 22.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		// Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
		// If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
		// This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
		guard let scene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: scene)
		
		window.rootViewController = assembly()
		window.makeKeyAndVisible()
		
		self.window = window
		
	}
	
	private func assembly() -> UIViewController {
		
		let storyboard = UIStoryboard(name: "LoginViewController", bundle: Bundle.main)
		
		guard let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
				as? LoginViewController
		else {
			fatalError("Нету на Main.storyboard MainViewController!")
		}
		return viewController
	}


}

