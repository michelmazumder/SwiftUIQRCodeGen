//
//  ContentView.swift
//  SwiftUIQRCodeGen
//
//  Created by Michel on 30/04/21.
//

import SwiftUI

struct ContentView: View {
	
	@ObservedObject var viewModel: ViewModel
	
	var body: some View {
		
		VStack {
			
			HStack {
				
				Text("QR String:").padding()
				TextField("http://www.apple.com", text: $viewModel.qrCodeString)
				
				Spacer()
				
				Button(action: viewModel.actionCreateQRCode, label: {
					Text("Create!")
				})
			}
			.padding()
			
			Spacer()
			
			if let qrCodeImage = viewModel.qrCodeImage {
				Image(uiImage: qrCodeImage)
					.interpolation(.none)
					.resizable()
					.scaledToFit()
					.padding()
			}
			
			Spacer()
			
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
