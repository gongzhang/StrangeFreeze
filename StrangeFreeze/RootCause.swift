//
//  RootCause.swift
//  StrangeFreeze
//
//  Created by Gong Zhang on 2024/11/23.
//

import SwiftUI
import StoreKit

extension View {
    
    // Hint:
    //
    // If you remove the following method, then everything will work fine.
    // Once the project links to `manageSubscriptionsSheet` in StoreKit, the app will freeze.
    
    func notEvenUsed() -> some View {
        self.manageSubscriptionsSheet(isPresented: .constant(false))
    }
}
