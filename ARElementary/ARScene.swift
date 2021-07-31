//
//  ARViewModel.swift
//  ARElementary
//
//  Created by Daniel O'Leary on 7/26/21.
//

import RealityKit
import SwiftUI

struct ARScene: View {
	var body: some View {
		return ARViewContainer()
			.edgesIgnoringSafeArea(.all)
	}
}


struct ARViewContainer: UIViewRepresentable {

	func makeUIView(context: Context) -> ARView {
		return ARDataModel.shared.arView
	}

	func updateUIView(_ uiView: ARView, context: Context) {}

}

