//
//  GameBoard.swift
//  BlendColor
//
//  Created by Takuto Nakamura on 2017/05/26.
//  Copyright © 2017年 Kyome. All rights reserved.
//

import UIKit

class GameBoard: UIView {

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.backgroundColor = UIColor.clear
	}

    override func draw(_ rect: CGRect) {
		drawBackBoard()
		drawFrame()
    }

	func drawBackBoard() {
		let frameL: CGFloat = self.bounds.width
		let corner: CGFloat = frameL * 0.032
		let path = UIBezierPath()

		path.move(to: CGPoint(x: corner, y: 0))
		path.addLine(to: CGPoint(x: frameL - corner, y: 0))
		path.addQuadCurve(to: CGPoint(x: frameL, y: corner), controlPoint: CGPoint(x: frameL, y: 0))
		path.addLine(to: CGPoint(x: frameL, y: frameL - corner))
		path.addQuadCurve(to: CGPoint(x: frameL - corner, y: frameL), controlPoint: CGPoint(x: frameL, y: frameL))
		path.addLine(to: CGPoint(x: corner, y: frameL))
		path.addQuadCurve(to: CGPoint(x: 0, y: frameL - corner), controlPoint: CGPoint(x: 0, y: frameL))
		path.addLine(to: CGPoint(x: 0, y: corner))
		path.addQuadCurve(to: CGPoint(x: corner, y: 0), controlPoint: CGPoint(x: 0, y: 0))
		path.close()
		UIColor(hex: "90A4AE").setFill()
		path.fill()
	}

	func drawFrame() {
		let frameL: CGFloat = self.bounds.width
		let corner: CGFloat = frameL * 0.032
		let pieceL: CGFloat = frameL * 0.21
		let path = UIBezierPath()

		for i in 0 ..< 16 {
			let offsetX: CGFloat = corner + CGFloat(i % 4) * (pieceL + corner)
			let offsetY: CGFloat = corner + CGFloat(i / 4) * (pieceL + corner)
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
		}

		UIColor(hex: "CFD8DC").setFill()
		path.fill()
	}

}
