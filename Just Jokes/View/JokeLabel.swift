import UIKit

class JokeLabel {
    // Factory for creating labels.
    static func create(frame: CGRect, text: String) -> UILabel {
        let label = UILabel()
        // TODO: No magic numbers (where possible)
        label.frame = CGRect(x: 20, y: (frame.size.height / 2) - 150, width: frame.width - 40, height: 300)
        label.backgroundColor = .white
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.text = text
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0

        // Drop shadow
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowRadius = 4.0
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        label.layer.masksToBounds = false

        return label
    }
}
