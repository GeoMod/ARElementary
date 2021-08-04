//
//  ARDataModel.swift
//  ARElementary
//
//  Created by Daniel O'Leary on 7/26/21.
//
import Combine
import RealityKit

final class ARDataModel: ObservableObject {
	static var shared = ARDataModel()

	@Published var arView: ARView

	// Sample published property allowing action from scene.
	//	@Published var willReset = false {
	//		didSet { resetScene() }
	//	}

	init() {
		arView = ARView()
		let scene = try! Experience.loadLetters()

		// Allow for gesture control in the scene.
		guard let A = scene.uppercaseA else { return }
		if let uppercaseA = A as? Entity & HasCollision {
			uppercaseA.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseA)
		}


		guard let B = scene.uppercaseB else { return }
		if let uppercaseB = B as? Entity & HasCollision {
			uppercaseB.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseB)
		}


		guard let C = scene.uppercaseC else { return }
		if let uppercaseC = C as? Entity & HasCollision {
			uppercaseC.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseC)
		}


		guard let D = scene.uppercaseD else { return }

		if let uppercaseD = D as? Entity & HasCollision {
			uppercaseD.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseD)
		}

		arView.scene.anchors.append(scene)
	}
	
	// MARK: Old Reference Code
	/*


	final class DataModel: ObservableObject {
		static var shared = DataModel()

		@Published var arView: ARView!

		@Published var willFlip = false {
			didSet { flipTesla() }
		}

		//	@Published var willReset = false {
		//		didSet { resetScene() }
		//	}


		//	@Published var scaleValue: Float = 50.0 {
		//		didSet { scaleTesla() }
		//	}


	}

	 */

	/*
	 struct ContentView : View {

		 // Dynamically get model name from bundle.
		 private var appModels: [String] = {
			 var availableModels: [String] = []
			 let fileManager = FileManager.default
			 guard let path = Bundle.main.resourcePath,
				   let files = try? fileManager.contentsOfDirectory(atPath: path)  else { return [] }

			 for fileName in files where
				 fileName.hasSuffix("usdz") {
				 let modelName = fileName.replacingOccurrences(of: ".usdz", with: "")
				 availableModels.append(modelName)
			 }
			 return availableModels
		 }()

		 @State private var selectionConfirmed = false
		 @State private var selectedModel: String? = nil

		 @State private var didTap = false

		 var body: some View {
			 ZStack(alignment: .bottom) {
				 ARViewContainer(modelAddedToScene: $selectedModel, didTap: $didTap)
				 VStack {
	 //				ConfirmCancelButtons(selectionConfirmed: $selectionConfirmed)
					 ModelPickerView(models: appModels, selectedModel: $selectedModel)
				 }
			 }
			 .edgesIgnoringSafeArea(.all)
		 }


	 }

	 struct ARViewContainer: UIViewRepresentable {
		 class Coordinator: NSObject, UIGestureRecognizerDelegate {
			 // TODO: You may not actally need a binding here unless there is a state change when tapping.
			 // the Raycasting goes in the tapGesture method and I think the work gets done there.
			 @Binding var didTap: Bool

			 init(didTap: Binding<Bool>) {
				 self._didTap = didTap
			 }

			 @objc func tapGesture() { // tapGesture(recognizer: UITapGestureRecognizer, uiView: ARView)
				 didTap = true
	 //			let point = recognizer.location(in: uiView)
	 //
	 //			guard let rayCastQuery = uiView.makeRaycastQuery(from: point, allowing: .existingPlaneInfinite, alignment: .horizontal) else { return }
	 //			let result = uiView.raycast(from: point, allowing: .existingPlaneInfinite, alignment: rayCastQuery.targetAlignment)
	 //
	 //			if let modelName = modelAddedToScene {
	 //				let fileName = modelName + ".usdz"
	 //				let modelEntity = try! ModelEntity.loadModel(named: fileName)
	 //				let anchor = AnchorEntity(raycastResult: result.first!)
	 //				anchor.addChild(modelEntity)
	 //				uiView.scene.anchors.append(anchor)
	 //			}
			 }
		 }

		 @Binding var modelAddedToScene: String?
		 @Binding var didTap: Bool

		 func makeCoordinator() -> Coordinator {
			 return Coordinator(didTap: $didTap)
		 }

		 func makeUIView(context: Context) -> ARView {
			 let arView = ARView(frame: .zero)
			 let recognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.tapGesture))
			 recognizer.delegate = context.coordinator

			 // Load the "Box" scene from the "Experience" Reality File
			 let boxAnchor = try! Experience.loadBox()

			 //		let configuration = ARWorldTrackingConfiguration()
			 //		configuration.planeDetection = .horizontal
			 //		configuration.environmentTexturing = .automatic
			 //
			 //		// For devices that support LIDAR
			 //		if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh) {
			 //			configuration.sceneReconstruction = .mesh
			 //		}

			 // Add the box anchor to the scene
			 arView.scene.anchors.append(boxAnchor)
			 arView.addGestureRecognizer(recognizer)

			 return arView
		 }

		 func updateUIView(_ uiView: ARView, context: Context) {

		 }
	 }

	 */

	// sample methods for manipulating the scene.
//	func flipTesla() {
//		if let teslaAnchor = arView.scene.anchors[0] as? Tesla.Scene {
//			teslaAnchor.notifications.flipTesla.post()
//		}
//	}
//
//	func loadLettersScene() {
//		DispatchQueue.main.async {
//			self.arView.scene.anchors.removeAll()
//
//			let lettersScene = try! Tesla.loadLetters()
//			self.arView.scene.anchors.append(lettersScene)
//		}
//	}

}


