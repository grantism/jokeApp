//
// View for displaying jokes
//
//  Created by Grant McNally on 2/1/2023.
//

import UIKit

// TODO: This can be broken down further to separate classes for each component
// TODO: No magic numbers (where possible)
class JokesView: UIView {
    private let scrollView = UIScrollView()
    private let scrollFrame: CGRect
    private let viewModel: JokesViewModel

    init(frame: CGRect, viewModel: JokesViewModel) {
        self.viewModel = viewModel
        self.scrollFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        super.init(frame: frame)

        let scrollViewSize = CGSize(
            width: scrollFrame.width * CGFloat(viewModel.jokes.count),
            height: scrollFrame.height
        )

        scrollView.frame = scrollFrame
        scrollView.contentSize = scrollViewSize
        scrollView.isPagingEnabled = true
        self.addSubview(scrollView)

        let more = UIButton()
        more.frame = CGRect(x: (frame.width / 2) - 100, y: frame.height - 80, width: 200, height: 40)
        more.backgroundColor = .gray
        more.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        more.setTitle("Another joke...", for: .normal)
        more.addAction(
            UIAction { _ in
                self.viewModel.fetchData {
                    DispatchQueue.main.async {
                        self.viewModel.configure(self)
                    }
                }
            },
            for: .touchUpInside
        )

        self.addSubview(more)

        backgroundColor = .white
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
            let scrollFrame = CGRect(x: frame.width * CGFloat(index), y: 0, width: frame.width, height: frame.height)
            let page = UIView()
            page.frame = scrollFrame
            page.backgroundColor = .white

            let jokeLabel = UILabel()
            jokeLabel.frame =  CGRect(x: 20, y: (frame.size.height / 2) - 150, width: frame.width - 40, height: 300)
            jokeLabel.backgroundColor = .gray
            jokeLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            jokeLabel.text = joke.text
            // jokeLabel.translatesAutoresizingMaskIntoConstraints = false
            jokeLabel.textColor = UIColor.white
            jokeLabel.textAlignment = .center
            jokeLabel.alpha = 1.0
            jokeLabel.numberOfLines = 0
            page.addSubview(jokeLabel)

            scrollView.addSubview(page)
        }
    }
}
