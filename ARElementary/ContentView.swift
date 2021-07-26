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
			VStack {
				Text("Elementary AR")
					.font(.headline)
				Button {
					print("Clicked")
				} label: {
					Image("LettersButton")
				}

				Button {
					print("Clicked")
				} label: {
					Image("ShapesButton")
				}

				NavigationLink("AR View!", destination: ARViewModel())
			}
			.navigationBarTitle(Text("AR Elementary"))
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
