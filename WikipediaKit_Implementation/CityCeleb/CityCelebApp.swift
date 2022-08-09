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
        // MARK: ADD your email
        WikipediaNetworking.appAuthorEmailForAPI = ""
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
