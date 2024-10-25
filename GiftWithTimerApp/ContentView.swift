//
//  ContentView.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 25.10.2024.
//
import SwiftUI
import UIKit

struct ContentView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return GiftViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
