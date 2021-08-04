//
//  AROverlayView.swift
//  ARElementary
//
//  Created by Daniel O'Leary on 8/2/21.
//
import Foundation

import ARKit
import RealityKit
import SwiftUI


struct ARCoaching: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct CoachingViewContainer: UIViewRepresentable {
	let overlay = ARCoachingOverlayView()

	func makeUIView(context: Context) -> ARView {
		let arView = ARView(frame: .zero)

		overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		overlay.goal = .horizontalPlane
		overlay.session = arView.session

		 return arView
	}

	func updateUIView(_ uiView: ARView, context: Context) {}
}


class Coaching: NSObject, ARCoachingOverlayViewDelegate {
	//
}
