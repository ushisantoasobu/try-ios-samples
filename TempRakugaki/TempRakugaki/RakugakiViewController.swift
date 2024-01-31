//
//  RakugakiViewController.swift
//  TempRakugaki
//
//  Created by 佐藤俊輔 on 2023/08/29.
//

import UIKit

enum Mode {
    case select
    case addPen
    case addText
}

var mode: Mode = .select

class RakugakiViewController: UIViewController, UIScrollViewDelegate {

    static func instantiate(
        image: UIImage
    ) -> RakugakiViewController {
        let sb = UIStoryboard(name: "RakugakiViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! RakugakiViewController
        vc.image = image
        return vc
    }
    
    var image: UIImage!
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    var pencilView: PencilView!
    var hogeView: HogeView!
    var selectionManagemantView: SelectionManagemantView!
    
    var pencilMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView()
        scrollView.delegate = self
        
        hogeView = HogeView()
        
        imageView = UIImageView(image: image)
        hogeView.addSubview(imageView)
        
        pencilView = PencilView(frame: .init(x: 0, y: 0,
                                             width: imageView.frame.size.width, height: imageView.frame.size.height
                                            ))
        pencilView.selected = { [weak self] view in
            guard let self else { return }
            selectionManagemantView.isHidden = false
            selectionManagemantView.selectedView = view
            
            let menu = UIMenuController.shared
            menu.arrowDirection = .default
            menu.menuItems = [
                .init(title: "削除？", action: #selector(self.deleteDrawingObject))
            ]
            menu.showMenu(from: view, rect: .zero)
        }
//        pencilView.backgroundColor = .red
//        pencilView.alpha = 0.4
        hogeView.addSubview(pencilView)
        
        selectionManagemantView = .init(
            frame: .init(x: 0, y: 0,
                         width: imageView.frame.size.width, height: imageView.frame.size.height
                        )
        )
        selectionManagemantView.isHidden = true
        selectionManagemantView.justTapped = { [weak self] in
            self?.selectionManagemantView.isHidden = true
        }
        hogeView.addSubview(selectionManagemantView)
        
        hogeView.frame = imageView.frame
        scrollView.addSubview(hogeView)
        
        print("@@@@@ \(imageView.frame)")
        print("@@@@@ \(pencilView.frame)")
        print("@@@@@ \(hogeView.frame)")
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(scrollView, at: 0)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    var first = true
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if first {
            let minimumZoomScale = scrollView.frame.size.height / image.size.height
            scrollView.maximumZoomScale = minimumZoomScale * 3
            scrollView.minimumZoomScale = minimumZoomScale
            scrollView.zoomScale = minimumZoomScale
            first = false
        }
    }

    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("scrollViewDidZoom \(scrollView.zoomScale)")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        hogeView
    }
    
    @objc
    func deleteDrawingObject(view: UIView) {
        pencilView.removeSelectedView()
    }
    
    @IBAction func selectTapped(_ sender: Any) {
        mode = .select
        scrollView.isScrollEnabled = true
    }
    
    @IBAction func addPenTapped(_ sender: Any) {
        mode = .addPen
        scrollView.isScrollEnabled = false
    }
    
    @IBAction func addTextTapped(_ sender: Any) {
//        pencilView.addSomeTextView()
        mode = .addText
        scrollView.isScrollEnabled = false
    }
}

// いい名前が思いつかないな、、scroll対象であり、画像も書き込みの選択時の表示なんかもつめこんだもの
class HogeView: UIView {
    
    var imageView: UIImageView!
    var pencilView: PencilView!
    var selectionManagemantView: SelectionManagemantView!
}

class SelectionManagemantView: UIView {
    
    var justTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .red
//        alpha = 0.2
    }
    
    var boundingView: UIView?
    
    var selectedView: UIView? {
        didSet {
            guard let selectedView else { return }
            subviews.forEach { $0.removeFromSuperview() }
            boundingView = UIView(frame: selectedView.frame)
            boundingView!.backgroundColor = .blue
            boundingView!.alpha = 0.5
            addSubview(boundingView!)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Select {
        case yes(point: SelectPoint)
        case no
    }
    
    enum SelectPoint {
        case leftTop
        case rightTop
        case rightBottom
        case leftBottom
    }
    
    var selecting: Select = .no
    
    func areaFromPoint(point: CGPoint, amount: CGFloat) -> CGRect {
        CGRect(x: point.x - amount, y: point.y - amount, width: amount * 2, height: amount * 2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1 else { return }
        guard let boundingView else { return }
        
        selecting = .no
        let beganPoint = touches.first!.location(in: self)
        if areaFromPoint(point: boundingView.frame.origin, amount: 20).contains(beganPoint) {
            selecting = .yes(point: .leftTop)
        } else if areaFromPoint(point: .init(x: boundingView.frame.origin.x + boundingView.frame.size.width, y: boundingView.frame.origin.y), amount: 20).contains(beganPoint) {
            selecting = .yes(point: .rightTop)
        } else if areaFromPoint(point: .init(x: boundingView.frame.origin.x + boundingView.frame.size.width, y: boundingView.frame.origin.y + boundingView.frame.size.height), amount: 20).contains(beganPoint) {
            selecting = .yes(point: .rightBottom)
        }  else if areaFromPoint(point: .init(x: boundingView.frame.origin.x + boundingView.frame.size.width, y: boundingView.frame.origin.y), amount: 20).contains(beganPoint) {
            selecting = .yes(point: .leftBottom)
        }
        
        print(selecting)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1 else { return }
        
        let movedPoint = touches.first!.location(in: self)
        
        switch selecting {
        case .yes(let point):
            switch point {
            case .leftTop:
                guard let selectedView else { return }
                let original = selectedView.frame
                selectedView.frame = .init(
                    x: movedPoint.x,
                    y: movedPoint.y,
                    width: original.origin.x - movedPoint.x + original.size.width,
                    height: original.origin.y - movedPoint.y + original.size.height
                )
            case .rightTop:
                break
            case .rightBottom:
                break
            case .leftBottom:
                break
            }
        case .no:
            break
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        justTapped?()
    }
}

class PencilView: UIView {
    
    var beganPoint: CGPoint?
    var movedPoint: CGPoint?
    var endPoint: CGPoint?
    
    var selected: ((UIView) -> Void)?
    
    func resetSelectedView() {
        subviews
            .filter { $0 is DrawingObjectView }
            .forEach { ($0 as! DrawingObjectView).selected = false }
    }
    
    func removeSelectedView() {
        let hit = subviews
            .filter { $0 is DrawingObjectView }
            .filter { ($0 as! DrawingObjectView).selected }
        hit.forEach {
            $0.removeFromSuperview()
        }
    }
    
    var moved = false
    var selectingView: DrawingObjectView?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        guard touches.count == 1 else { return }
        
        // reset
        moved = false
        selectingView = nil
        
        beganPoint = touches.first!.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
        guard touches.count == 1 else { return }
        
        movedPoint = touches.first!.location(in: self)
        
        if let selectingView {
            selectingView.center = movedPoint!
        } else {
            if beganPoint! != movedPoint {
                let hit = subviews
                    .filter { $0 is DrawingObjectView }
                    .filter { ($0 as! DrawingObjectView).contains(point: beganPoint!) }
                    .first as? DrawingObjectView
                if let hit {
                    selectingView = hit
                    selectingView?.center = movedPoint!
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        guard touches.count == 1 else { return }
        endPoint = touches.first!.location(in: self)
        
        // 始点・終点が同一であり（しきい値いる？）、moveの痕跡もない場合は「タップ」とみなす
        if beganPoint! == endPoint! && !moved {
            print("同一点")
            let hit = subviews
                .filter { $0 is DrawingObjectView }
                .filter { ($0 as! DrawingObjectView).contains(point: beganPoint!) }
                .first as? DrawingObjectView
            if let hit {
                // タップしたオブジェクトがあるとき
                hit.selected = true
                selected?(hit)
            } else {
                // タップしたオブジェクトがないとき
                if mode == .addText {
                    // add text
                    let item = TextItemView(frame: .init(origin: beganPoint!, size: .init(width: 100, height: 100)))
                    addSubview(item)
                    item.text = "hogehoge!!"
                    setNeedsDisplay()
                } else {
                    resetSelectedView()
                }
            }
            return
        }
        
        // 何かviewを選択状態のとき
        if let selectingView {
            return
        }
        
        // add pencil
        let item = PencilItemView(
            frame: .init(
                x: min(beganPoint!.x, endPoint!.x),
                y: min(beganPoint!.y, endPoint!.y),
                width: abs(beganPoint!.x - endPoint!.x),
                height: abs(beganPoint!.y - endPoint!.y)
            )
        )
        item.beganPoint = .init(
            x: beganPoint!.x - min(beganPoint!.x, endPoint!.x),
            y: beganPoint!.y - min(beganPoint!.y, endPoint!.y)
        )
        item.endPoint = .init(
            x: endPoint!.x - min(beganPoint!.x, endPoint!.x),
            y: endPoint!.y - min(beganPoint!.y, endPoint!.y)
        )
        item.setup()
        
        addSubview(item)
        print("@@@@@ subviews.count: \(subviews.count)")
        setNeedsDisplay()
    }
}

class DrawingObjectView: UIView {
    var selected: Bool = false {
        didSet {
//            if selected {
//                alpha = 0.2
//            } else {
//                alpha = 1.0
//            }
        }
    }
    
    func contains(point: CGPoint) -> Bool {
        false
    }
}

class TextItemView: DrawingObjectView {
    
    var text: String?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let text else { return }
        
        let center = self.center
        
        let path = text.bezierPath(withFont: UIFont.systemFont(ofSize: 64))
        let shapeLayer = CAShapeLayer(layer: layer)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
//        shapeLayer.strokeColor = lineColor
//        shapeLayer.lineWidth = 2
        layer.addSublayer(shapeLayer)
        
        self.center = center
        
        frame = .init(x: frame.origin.x, y: frame.origin.y, width: path.bounds.width, height: path.bounds.height)
    }
    
    override func contains(point: CGPoint) -> Bool {
        if frame.contains(point) {
            return true
        }
        print("@@@@@ frame: \(frame)")
        print("@@@@@ point: \(point)")
        
        return false
    }
}

extension String {
    func annotationAttributedString(fontSize: CGFloat, textColor: UIColor) -> NSAttributedString {
//        let font = UIFont(name: CustomFont.ipaExGothic.fontName, size: fontSize)!
        let font = UIFont.systemFont(ofSize: fontSize)
        
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        style.lineBreakMode = .byCharWrapping
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.paragraphStyle: style,
            NSAttributedString.Key.kern: 0.0,
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.foregroundColor: textColor
        ]
        return NSAttributedString(string: self, attributes: attributes)
    }
}

class PencilItemView: DrawingObjectView {
    
    var beganPoint: CGPoint?
    var endPoint: CGPoint?
    
    var path: UIBezierPath!
    
    func setup() {
        guard let beganPoint = beganPoint, let endPoint = endPoint else { return }
        
        backgroundColor = .clear

        path = UIBezierPath()
        path.move(to: beganPoint)
        path.addLine(to: endPoint)
        
        let fillLayer = CAShapeLayer()
        fillLayer.path = path.cgPath
        fillLayer.lineWidth = 40
        fillLayer.strokeColor = UIColor.red.cgColor
        layer.addSublayer(fillLayer)
    }
    
    override func contains(point: CGPoint) -> Bool {
//        guard let path = layer.path else { return false }
//        let laxness = self.laxness / zoomScale
        
        //
//        let copyPath = path.copy(strokingWithWidth: 40 * 3, lineCap: .butt, lineJoin: .bevel, miterLimit: 0)
//        let copyPath = path.copy() as! UIBezierPath
//        copyPath.lineWidth = 40 * 4
        
        // is tap line
//        if copyPath.contains(point) {
//            return true
//        }
        
        if frame.contains(point) {
            return true
        }
        print("@@@@@ frame: \(frame)")
        print("@@@@@ point: \(point)")
        
        return false
    }
}








extension String {
    func bezierPath(withFont font: UIFont) -> UIBezierPath {
        // create CTFont with UIFont
        let ctFont = CTFontCreateWithName(font.fontName as CFString,
                                          font.pointSize, nil)
        // create a container CGMutablePath for letter paths
        let letters = CGMutablePath()
        // create a NSAttributedString from self
        let attrString = NSAttributedString(string: self,
                                            attributes: [.font: font])
        // get CTLines from attributed string
        let line = CTLineCreateWithAttributedString(attrString)
        // get CTRuns from line
        let runs = CTLineGetGlyphRuns(line) as! [CTRun]
        for run in runs {
            // number of gylph available
            let  glyphCount = CTRunGetGlyphCount(run)
            for i in 0 ..< glyphCount {
                // take one glyph from run
                let range = CFRangeMake(i, 1)
                // create array to hold glyphs, this should have array with one item
                var glyphs = [CGGlyph](repeating: 0,
                                       count: range.length)
                // create position holder
                var position = CGPoint()
                // get glyph
                CTRunGetGlyphs(run,
                               range,
                               &glyphs)
                // glyph postion
                CTRunGetPositions(run,
                                  range,
                                  &position)
                // append glyph path to letters
                for glyph in glyphs {
                    if let letter = CTFontCreatePathForGlyph(ctFont,
                                                             glyph, nil) {
                        letters.addPath(letter,
                                        transform: CGAffineTransform(translationX: position.x,
                                                                     y: position.y))
                    }
                }

            }
        }
        // following lines normalize path. this path is created with textMatrix so it should first be normalized to nomral matrix
        let lettersRotated = CGMutablePath()
        lettersRotated.addPath(letters,
                               transform: CGAffineTransform(scaleX: 1,
                                                            y: -1))
        let lettersMoved = CGMutablePath()
        lettersMoved.addPath(lettersRotated,
                             transform: CGAffineTransform(translationX: 0,
                                                          y: lettersRotated
                                                            .boundingBoxOfPath
                                                            .size
                                                            .height))
        // create UIBezierPath
        let bezier = UIBezierPath(cgPath: lettersMoved)
        return bezier
    }
}
