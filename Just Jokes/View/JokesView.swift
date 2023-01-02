//
// View for displaying jokes
//
//  Created by Grant McNally on 2/1/2023.
//

import UIKit

class JokesView: UIView {
    let scrollView = UIScrollView()
    let viewModel: JokesViewModel
    let scrollFrame: CGRect

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
        more.frame =  CGRect(x: 0, y: frame.height - 50, width: 200, height: 10)
        more.backgroundColor = .gray
        more.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        more.setTitle("More", for: .normal)
        more.addAction(UIAction { _ in
            self.viewModel.jokes.append(self.viewModel.jokes.first!)
            self.viewModel.configure(self)
        }, for: .touchUpInside)

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
