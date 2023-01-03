//
// View for displaying jokes
//
//  Created by Grant McNally on 2/1/2023.
//

import UIKit

// TODO: This can be broken down further to separate classes for each component (like JokeLabel.swift)
class JokesView: UIView {
    private let scrollView = UIScrollView()
    private let scrollFrame: CGRect
    private let viewModel: JokesViewModel

    init(frame: CGRect, viewModel: JokesViewModel) {
        self.viewModel = viewModel
        self.scrollFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        super.init(frame: frame)

        backgroundColor = .white

        let scrollViewSize = CGSize(
            width: scrollFrame.width * CGFloat(viewModel.jokes.count),
            height: scrollFrame.height
        )

        scrollView.frame = scrollFrame
        scrollView.contentSize = scrollViewSize
        scrollView.isPagingEnabled = true

        addSubview(scrollView)
        addMoreButton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addPages() {
        scrollView.contentSize = CGSize(
            width: scrollFrame.width * CGFloat(viewModel.jokes.count),
            height: scrollFrame.height
        )

        for (index, joke) in viewModel.jokes.enumerated() {
            let page = Page.create(frame: frame, index: CGFloat(index))
            let jokeLabel = JokeLabel.create(frame: frame, text: joke.text)

            page.addSubview(jokeLabel)
            scrollView.addSubview(page)
        }

    func addMoreButton() {
        let button = UIButton()
        // TODO: No magic numbers (where possible)
        button.frame = CGRect(x: (frame.width / 2) - 100, y: frame.height - 80, width: 200, height: 40)
        button.backgroundColor = .gray
        button.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        button.setTitle("Another joke...", for: .normal)
        button.addAction(
            UIAction { _ in
                self.viewModel.fetchData {
                    DispatchQueue.main.async {
                        self.viewModel.configure(self)
                    }
                }
            },
            for: .touchUpInside
        )
        self.addSubview(button)
    }
}
