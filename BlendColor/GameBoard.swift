//
//  GameBoard.swift
//  BlendColor
//
//  Created by Takuto Nakamura on 2017/05/26.
//  Copyright © 2017年 Kyome. All rights reserved.
//

import UIKit

class GameBoard: UIView {

    override func draw(_ rect: CGRect) {
		drawBackBoard()
//		drawFrame()
    }

	func drawBackBoard() {
		let frameL: CGFloat = self.bounds.width
		let corner: CGFloat = frameL * 0.04
		let path = UIBezierPath()

		path.move(to: CGPoint(x: corner, y: 0))
		path.addLine(to: CGPoint(x: frameL - corner, y: 0))
		path.addQuadCurve(to: CGPoint(x: frameL, y: 0), controlPoint: CGPoint(x: frameL, y: 0))
		path.addLine(to: CGPoint(x: frameL, y: frameL - corner))
		path.addQuadCurve(to: CGPoint(x: frameL - corner, y: frameL), controlPoint: CGPoint(x: frameL, y: frameL))
		path.addLine(to: CGPoint(x: corner, y: frameL))
		path.addQuadCurve(to: CGPoint(x: 0, y: frameL - corner), controlPoint: CGPoint(x: 0, y: frameL))
		path.addLine(to: CGPoint(x: 0, y: corner))
		path.addQuadCurve(to: CGPoint(x: corner, y: 0), controlPoint: CGPoint(x: 0, y: 0))
		path.close()
		UIColor(hex: "CFD8DC").setFill()
		path.fill()
	}

//	func drawFrame() {
//		let frameL: CGFloat = self.bounds.width
//		let corner: CGFloat = frameL * 0.04
//		let pieceL: CGFloat = frameL * 0.20
//		let path = UIBezierPath()
//		path.usesEvenOddFillRule = true
//	}

}
