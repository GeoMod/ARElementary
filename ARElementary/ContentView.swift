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
				NavigationLink("AR View!", destination: ARViewModel())
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
