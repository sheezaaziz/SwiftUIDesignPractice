//
//  UpdateStore.swift
//  DesignCodeTut
//
//  Created by Sheeza Aziz on 2021-10-08.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
