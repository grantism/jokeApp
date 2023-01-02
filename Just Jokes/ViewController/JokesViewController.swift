//
//  ViewController
//
//  Created by Grant McNally on 29/12/2022.
//

import UIKit

class JokesViewController: UIViewController {
    var jokesViewModel: JokesViewModelType!
    var jokesView: JokesView?

    // Mock for testing
    init(viewModel: JokesViewModelType) {
        jokesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    // Required when called from storyboard
    required init?(coder aDecoder: NSCoder) {
        jokesViewModel = JokesViewModel()
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        jokesViewModel.fetchData { _ in
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }

    func updateUI() {
        jokesView = JokesView(frame: view.frame)
        jokesViewModel.configure(jokesView!)
        view.addSubview(jokesView!)
    }
}
