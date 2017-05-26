//
//  MainVC.swift
//  BlendColor
//
//  Created by Takuto Nakamura on 2017/05/26.
//  Copyright © 2017年 Kyome. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

	@IBOutlet weak var gameBoard: GameBoard!
	@IBOutlet weak var gamePieces: GamePieces!

	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(self.ChangedDeviceOrientation(n:)),
		                                       name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
	}

	override func viewWillAppear(_ animated: Bool) {
		let w = self.view.bounds.width
		let h = self.view.bounds.height

		gameBoard.frame.size = CGSize(width: min(w, h) * 0.92, height: min(w, h) * 0.92)
		gameBoard.center = CGPoint(x: w * 0.5, y: h * 0.5)

		gamePieces.frame.size = CGSize(width: min(w, h) * 0.92, height: min(w, h) * 0.92)
		gamePieces.center = CGPoint(x: w * 0.5, y: h * 0.5)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}

	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
		return UIInterfaceOrientationMask.all
	}

	func ChangedDeviceOrientation(n: NSNotification) {
		let w = self.view.bounds.width
		let h = self.view.bounds.height

		gameBoard.frame.size = CGSize(width: min(w, h) * 0.92, height: min(w, h) * 0.92)
		gameBoard.center = CGPoint(x: w * 0.5, y: h * 0.5)

		gamePieces.frame.size = CGSize(width: min(w, h) * 0.92, height: min(w, h) * 0.92)
		gamePieces.center = CGPoint(x: w * 0.5, y: h * 0.5)
	}

}
