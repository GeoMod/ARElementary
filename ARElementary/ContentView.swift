//
//  ContentView.swift
//  ARElementary
//
//  Created by Daniel O'Leary on 7/26/21.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationView {
			ZStack {
				BackgroundImage
				VStack {
					TitleText
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

					Spacer()
				}
			}
		}
	}


	private var BackgroundImage: some View {
		Image("background")
			.resizable()
			.renderingMode(.original)
			.edgesIgnoringSafeArea(.all)
	}

	private var TitleText: some View {
		Text("Move and Match AR")
			.font(.largeTitle.bold())
			.foregroundColor(.orange)
			.padding(.bottom, 75)
	}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
    }
}
