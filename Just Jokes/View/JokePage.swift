import UIKit

// Factory for creating pages
class Page {
    static func create(frame: CGRect, index: CGFloat) -> UIView {
        let scrollFrame = CGRect(x: frame.width * CGFloat(index), y: 0, width: frame.width, height: frame.height)
        let page = UIView()
        page.frame = scrollFrame
        page.backgroundColor = .white

        return page
    }
}
