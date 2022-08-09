//
//  CityCelebApp.swift
//  CityCeleb
//
//  Created by Seyfülmülük Kutluk on 15.07.2022.
//

import SwiftUI
import WikipediaKit

@main
struct CityCelebApp: App {
    init() {
        WikipediaNetworking.appAuthorEmailForAPI = ""
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
