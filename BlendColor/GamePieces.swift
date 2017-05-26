//
//  GamePieces.swift
//  BlendColor
//
//  Created by Takuto Nakamura on 2017/05/27.
//  Copyright © 2017年 Kyome. All rights reserved.
//

// Red     : #EE4444
// Blue    : #44EE44
// Green   : #4444EE
// white   : #EEEEEE
// Magenta : #EE44EE
// Cyan    : #44EEEE
// Yellow  : #EEEE44
// Black   : #444444

import UIKit

class GamePieces: UIView {
	var colorList: [String] = ["EE4444", "44EE44", "4444EE", "EEEEEE",
	                           "EE44EE", "44EEEE", "EEEE44", "444444"]

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.backgroundColor = UIColor.clear
	}

	override func draw(_ rect: CGRect) {
		drawPieces()
    }

	func drawPiece(n: Int, m: Int, color: String) {
		let frameL: CGFloat = self.bounds.width
		let corner: CGFloat = frameL * 0.032
		let pieceL: CGFloat = frameL * 0.21

		let offsetX: CGFloat = corner + CGFloat(n) * (pieceL + corner)
		let offsetY: CGFloat = corner + CGFloat(m) * (pieceL + corner)
		let path = UIBezierPath()
		path.move(to: CGPoint(x: offsetX + corner, y: offsetY))
		path.addLine(to: CGPoint(x: offsetX + pieceL - corner, y: offsetY))
		path.addQuadCurve(to: CGPoint(x: offsetX + pieceL, y: offsetY + corner), controlPoint: CGPoint(x: offsetX + pieceL, y: offsetY))
		path.addLine(to: CGPoint(x: offsetX + pieceL, y: offsetY + pieceL - corner))
		path.addQuadCurve(to: CGPoint(x: offsetX + pieceL - corner, y: offsetY + pieceL), controlPoint: CGPoint(x: offsetX + pieceL, y: offsetY + pieceL))
		path.addLine(to: CGPoint(x: offsetX + corner, y: offsetY + pieceL))
		path.addQuadCurve(to: CGPoint(x: offsetX, y: offsetY + pieceL - corner), controlPoint: CGPoint(x: offsetX, y: offsetY + pieceL))
		path.addLine(to: CGPoint(x: offsetX, y: offsetY + corner))
		path.addQuadCurve(to: CGPoint(x: offsetX + corner, y: offsetY), controlPoint: CGPoint(x: offsetX, y: offsetY))
		path.close()
		UIColor(hex: color).setFill()
		path.fill()
	}

	func drawPieces() {
		for i in 0 ..< 8 {
			drawPiece(n: i % 4, m: i / 4, color: colorList[i])
		}
	}

}
