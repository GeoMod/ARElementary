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
		ZStack {
			ARViewContainer()
				.edgesIgnoringSafeArea(.all)
			ARSceneActivationButtons()
		}
	}
}

struct ARSceneActivationButtons: View {
	@State private var arSceneIsActive = false

	var body: some View {
		VStack {
			Spacer()
			HStack {
				Button {
					ARDataModel.shared.beginARScene()
					arSceneIsActive.toggle()
				} label: {
					Image(systemName: "plus.circle")
						.padding([.leading, .trailing], 45)
				}
				.clipShape(RoundedRectangle(cornerRadius: 3.0))
				.buttonStyle(.bordered)
				.opacity(arSceneIsActive ? 0 : 0.80)
				Spacer()
				Button {
					ARDataModel.shared.resetScene()
					arSceneIsActive.toggle()
				} label: {
					Image(systemName: "arrow.uturn.backward.circle")
						.padding([.leading, .trailing], 45)
				}
				.clipShape(RoundedRectangle(cornerRadius: 3.0))
				.buttonStyle(.bordered)
				.opacity(arSceneIsActive ? 1 : 0.0)
			}
			.font(.largeTitle)
			.animation(.easeIn, value: arSceneIsActive)
		}
	}
}

// MARK: UIViewRepresentable
struct ARViewContainer: UIViewRepresentable {
	func makeUIView(context: Context) -> ARView {
		return ARDataModel.shared.arView
	}

	func updateUIView(_ uiView: ARView, context: Context) {}
}
