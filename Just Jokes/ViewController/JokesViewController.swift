//
//  ViewController
//
//  Created by Grant McNally on 29/12/2022.
//

import UIKit

class JokesViewController: UIViewController {
    var jokesViewModel: JokesViewModel
    var jokesView: JokesView?

    // Mock VM for testing
    init(viewModel: JokesViewModel) {
        jokesViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        updateUI()
    }

    // Required when called from storyboard
    required init?(coder aDecoder: NSCoder) {
        jokesViewModel = JokesViewModel()
        super.init(coder: aDecoder)
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        jokesViewModel.fetchData {
            DispatchQueue.main.async {
                self.updateUI()
            }
        }
    }

    func updateUI() {
        jokesView = JokesView(frame: view.frame, viewModel: jokesViewModel)
        view = jokesView
        jokesViewModel.configure(jokesView!)
    }
}
