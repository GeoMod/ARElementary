//
//  ARDataModel.swift
//  ARElementary
//
//  Created by Daniel O'Leary on 7/26/21.
//

import ARKit
import Combine
import RealityKit

class ARDataModel: NSObject, ObservableObject, ARSessionDelegate {
	@Published var arView: ARView
	@Published var arrowPositions = [SCNVector3]()

	let lettersScene = try! Experience.loadLetters()
	let placementArrowScene = try! Experience.loadPlacementArrow()

	static var shared = ARDataModel()

	// Sample published property allowing action from scene.
	//	@Published var willReset = false {
	//		didSet { resetScene() }
	//	}

	override init() {
		arView = ARView()
		super.init()
		arView.session.delegate = self
		setupCoachingOverlay()

		arView.scene.anchors.append(placementArrowScene)
	}

	func setupCoachingOverlay() {
		let coachingOverlay = ARCoachingOverlayView(frame: arView.frame)
		arView.addSubview(coachingOverlay)

		// Set overlay constraints to the full frame.
		coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		// Look for horizontal plane as anchor.
		coachingOverlay.goal = .horizontalPlane

		coachingOverlay.session = arView.session
	}

	func beginARScene() {
		arView.scene.anchors.append(lettersScene)
	}

	func resetScene() {
		arView.scene.anchors.removeAll()
	}

	func session(_ session: ARSession, didUpdate frame: ARFrame) {
		// if game has not started
		let hitTest = arView.hitTest(arView.center, types: .featurePoint)
		let result = hitTest.last
		guard let transform = result?.worldTransform else { return }
		let thirdColumn = transform.columns.3
		let position = SCNVector3Make(thirdColumn.x, thirdColumn.y, thirdColumn.z)
		arrowPositions.append(position)

		// Average the last 10 positions. Note the type is of ArraySlice<SCNVector3>
		let lastTenPositions = arrowPositions.suffix(10)

		// Get access to the Arrow Entity in the placement arrow scene.
		let arrow = arView.scene.findEntity(named: "GroupedArrow")
		arrow?.position = getAveragePosition(from: lastTenPositions)
		// getAveragePosition(from: lastTenPositions)
	}

	func renderer(_ renderer: Scene, updateAtTime time: TimeInterval) {

	}

	// Function to average the positions given.
	func getAveragePosition(from positions: ArraySlice<SCNVector3>) -> SIMD3<Float> {
		var averageX = Float()
		var averageY = Float()
		var averageZ = Float()

		for position in positions {
			averageX += position.x
			averageY += position.y
			averageZ += position.z
		}

		// The number of all positions given.
		let count = Float(positions.count)
		let vector = SCNVector3Make(averageX/count, averageY/count, averageZ/count)

		return SIMD3(vector)
		//	func getAveragePosition(from positions: ArraySlice<SCNVector3>) -> SCNVector3 {
		//		var averageX = Float()
		//		var averageY = Float()
		//		var averageZ = Float()
		//
		//		for position in positions {
		//			averageX += position.x
		//			averageY += position.y
		//			averageZ += position.z
		//		}
		//
		//		// The number of all positions given.
		//		let count = Float(positions.count)
		//
		//		// Send this for the position of the pointer arrow. Averaged from the last 10 given positons for smoother indications.
		//		return SCNVector3Make(averageX/count, averageY/count, averageZ/count)
		//	}
	}



}


extension ARDataModel: ARCoachingOverlayViewDelegate {
	func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
		// Doesn't appear to fire
		// 8/5/21
		arView.isHidden = true
	}

	func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
		arView.isHidden = false
	}
}
