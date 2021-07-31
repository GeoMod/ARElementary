//
//  ContentView.swift
//  ARElementary
//
//  Created by Daniel O'Leary on 7/26/21.
//

import SwiftUI

struct ContentView: View {
	let backgroundGradient = Gradient(colors: [Color(.systemOrange), Color(.systemPurple), Color(.systemOrange), Color(.systemTeal)])
    var body: some View {
		NavigationView {
			ZStack {
//				RadialGradient(gradient: backgroundGradient, center: .center, startRadius: 1, endRadius: 1000)
				Image("background")
					.resizable()
					.renderingMode(.original)
					.edgesIgnoringSafeArea(.all)
				VStack(alignment: .leading) {
					Text("AR Elementary")
						.font(.largeTitle.bold())
						.foregroundColor(.white)
						.shadow(radius: 20)
					HStack {
						NavigationLink(destination: ARScene()) {
							Image("LettersButton")
								.shadow(color: .black, radius: 2, x: 2)
								.accessibility(label: Text("Letters Game"))
								.accessibility(hint: Text("Tap to open letters matching game."))

						}
						Spacer().frame(width: 50)
						NavigationLink(destination: Text("Shapes Game")) {
							Image("ShapesButton")
								.shadow(color: .black, radius: 2, x: 2)
								.accessibility(label: Text("Shapes Game"))
								.accessibility(hint: Text("Tap to open shapes matching game."))
						}
					}
					Text("Choose a game")
						.font(.largeTitle)
						.foregroundColor(.white)
					Spacer()
				}

			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
