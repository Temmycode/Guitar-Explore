//
//  PageIndicator.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 11/03/2024.
//

import SwiftUI

struct PageIndicator: UIViewRepresentable {
    var noOfPages: Int
    var activePage: Int
    var onPageChange: (Int) -> ()

    func makeCoordinator() -> Coordinator {
        return Coordinator(onPageChange: onPageChange)
    }

    func makeUIView(context: Context) -> UIPageControl {
        let view = UIPageControl()
        view.currentPage = activePage
        view.numberOfPages = noOfPages
        view.backgroundStyle = .automatic
        view.currentPageIndicatorTintColor = UIColor(Color.primary)
        view.pageIndicatorTintColor = UIColor.placeholderText
        view.addTarget(context.coordinator, action: #selector(Coordinator.onPageUpdate(control:)), for: .valueChanged)
        return view
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = noOfPages
        uiView.currentPage = activePage
    }

    class Coordinator: NSObject {
        var onPageChange: (Int) -> ()

        init(onPageChange: @escaping (Int) -> Void) {
            self.onPageChange = onPageChange
        }

        @objc
        func onPageUpdate(control: UIPageControl) {
            onPageChange(control.currentPage)
        }
    }
}
