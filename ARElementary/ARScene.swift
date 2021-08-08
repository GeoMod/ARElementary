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

struct ARViewContainer: UIViewRepresentable {
	func makeUIView(context: Context) -> ARView {
		return ARDataModel.shared.arView
	}

	func updateUIView(_ uiView: ARView, context: Context) {}
}

struct ARSceneActivationButtons: View {
	@State private var arSceneIsActive = false

	var body: some View {
		VStack {
			Spacer()
			Button {
				ARDataModel.shared.beginARScene()
				arSceneIsActive = true
			} label: {
				Image(systemName: "plus.circle")
					.font(.largeTitle)
					.foregroundColor(.gray)
					.padding([.leading, .trailing], 45)
			}
			.clipShape(RoundedRectangle(cornerRadius: 3.0))
			.buttonStyle(.bordered)
			.opacity(arSceneIsActive ? 0 : 1)
			.animation(.easeIn, value: arSceneIsActive)
			Spacer()
			HStack {
				Spacer()
				Button {
					ARDataModel.shared.resetScene()
					arSceneIsActive = false
				} label: {
					Image(systemName: "arrow.uturn.backward.circle")
						.font(.largeTitle)
						.foregroundColor(.blue)
						.padding()
				}
				.opacity(arSceneIsActive ? 1 : 0.8)
				.animation(.easeIn, value: arSceneIsActive)
			}
		}
	}
}
