//
//  ImageLoader.swift
//  Flow
//
//  Created by Vlad Novol on 2/17/21.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    private var cancellable: AnyCancellable?
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
