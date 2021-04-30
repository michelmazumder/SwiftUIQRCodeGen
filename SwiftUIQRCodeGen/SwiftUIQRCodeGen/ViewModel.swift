//
//  ViewModel.swift
//  SwiftUIQRCodeGen
//
//  Created by Michel on 30/04/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

class ViewModel : ObservableObject {
	
	
	@Published var qrCodeString = ""
	@Published var qrCodeImage: UIImage? = nil
	
	let context = CIContext()
	let filter = CIFilter.qrCodeGenerator()
	
	func actionCreateQRCode() {
		qrCodeImage = generateQRCode(from: qrCodeString)
	}
	
	func generateQRCode(from string: String) -> UIImage {
		let data = Data(string.utf8)
		filter.setValue(data, forKey: "inputMessage")
		
		if let outputImage = filter.outputImage {
			if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
				return UIImage(cgImage: cgimg)
			}
		}
		
		return UIImage(systemName: "xmark.circle") ?? UIImage()
	}
	
}
