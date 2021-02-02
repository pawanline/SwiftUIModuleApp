//
//  ContentView.swift
//  AppLockWithSwiftUI
//
//  Created by Pawan Kumar on 02/02/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appLockVM: AppLockViewModel
    
    var body: some View {
        ZStack {
            // Show HomeView app lock is not enabled or app is in unlocked state
            if !appLockVM.isAppLockEnabled || appLockVM.isAppUnLocked {
                AppHomeView()
            } else {
                AppLockView()
            }
        }
        .onAppear {
            // if 'isAppLockEnabled' value true, then immediately do the app lock validation
            if appLockVM.isAppLockEnabled {
                appLockVM.appLockValidation()
            }
        }
    }
}
