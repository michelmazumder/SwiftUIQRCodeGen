//
//  SwiftUIQRCodeGenApp.swift
//  SwiftUIQRCodeGen
//
//  Created by Michel on 30/04/21.
//

import SwiftUI

@main
struct SwiftUIQRCodeGenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
