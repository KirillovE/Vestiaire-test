//
//  DayCellContent.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import UIKit

@IBDesignable
final class DayCellContent: UIView {

    let nibName = "DayCellContent"
    var contentView: UIView?
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}
