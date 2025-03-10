//
//  NotchViewModel.swift
//  DynamicNotch
//
//  Created by PeterPark on 2/26/25.
//
import Defaults
import Combine
import SwiftUI

class NotchViewModel: NSObject, ObservableObject {
    @ObservedObject var coordinator = Coordinator.shared
    
    let animation: Animation? = nil
    
    @Published var mainView: NotchMainFeaturesView = .home
    @Published private var notchState: NotchStatus = .off
}
