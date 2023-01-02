//
// View for displaying jokes
//
//  Created by Grant McNally on 2/1/2023.
//

import UIKit

class JokesView: UIView {
    var jokeLabel = UILabel()

    public override init(frame: CGRect) {
        let labelframe = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        jokeLabel.frame = labelframe
        jokeLabel.backgroundColor = .white
        jokeLabel.translatesAutoresizingMaskIntoConstraints = false
        jokeLabel.numberOfLines = 3

        super.init(frame: frame)
        self.addSubview(jokeLabel)
        backgroundColor = .white
        addConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        let guide = self.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            jokeLabel.topAnchor.constraint(equalTo: guide.topAnchor),
            jokeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
