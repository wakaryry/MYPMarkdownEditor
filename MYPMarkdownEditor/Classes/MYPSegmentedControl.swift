//
//  MYPSegmentedControl.swift
//  MYPMarkdownEditor
//
//  Created by wakary redou on 2018/5/26.
//

import UIKit

public class MYPSegmentedControl: UIControl {

    public weak var delegate: MYPSegmentedControlDelegate?
    private var itemViews: [UIImageView]?
    private var slideBlockView = UIView()
    public var numberOfSegments: Int {
        return self.itemViews?.count ?? 0
    }
    public private(set) var selectedSegmentIndex: Int = 0
    public var changeSegmentManually = false
    
    public init(items: [UIImage]) {
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.backgroundColor = .white
        
        for item in items {
            let itemView = UIImageView(image: item)
            itemView.contentMode = .scaleAspectFit
            self.addSubview(itemView)
            self.itemViews?.append(itemView)
        }
        self.slideBlockView.backgroundColor = .darkGray
        self.addSubview(self.slideBlockView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(gestrue:)))
        self.addGestureRecognizer(tap)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        var rect = self.bounds
        let itemWidth = rect.width / CGFloat(self.numberOfSegments)
        let itemHeight = rect.height - 4.0
        rect.size = CGSize(width: itemWidth, height: itemHeight)
        rect.origin.y = 1.0
        if self.numberOfSegments > 0 {
            for itemView in self.itemViews! {
                itemView.frame = rect.insetBy(dx: itemWidth / 4, dy: itemHeight / 4)
                rect.origin.x += itemWidth
            }
            rect.size.width = itemWidth - 20.0
            rect.size.height = 2.0
            rect.origin.y = self.bounds.height - 3.0
            let selectedItemView = self.itemViews![self.selectedSegmentIndex]
            rect.origin.x = selectedItemView.center.x - rect.width / 2.0
            self.slideBlockView.frame = rect
        }
    }
    
    @objc
    private func handleTap(gestrue: UITapGestureRecognizer) {
        let point = gestrue.location(in: self)
        let itemWidth = self.bounds.width / CGFloat(self.numberOfSegments)
        let index: Int = Int(point.x / itemWidth)
        
        self.delegate?.mypDidTapSegmentedControl(self, at: index)
        
        if !self.changeSegmentManually {
            self.selectSegment(at: index, animated: true)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func selectSegment(at index: Int, animated: Bool) {
        if self.selectedSegmentIndex == index {
            return
        }
        
        self.selectedSegmentIndex = index
        if animated {
            UIView.animate(withDuration: 0.2) {
                self.layoutSubviews()
            }
        }
        else {
            self.layoutSubviews()
        }
        self.sendActions(for: .valueChanged)
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0.5))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0.5))
        path.move(to: CGPoint(x: 0, y: rect.maxY - 0.5))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 0.5))
        path.lineWidth = 1.0
        UIColor(white: 0.9, alpha: 1.0).setStroke()
        path.stroke()
    }
}

public protocol MYPSegmentedControlDelegate: class {
    func mypDidTapSegmentedControl(_ control: MYPSegmentedControl, at index: Int)
}
