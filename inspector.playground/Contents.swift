//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let containerView = UIView(
            frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0)
        )
        containerView.backgroundColor = UIColor.white
        
        let blackSquare = UIView(
            frame: CGRect(x: 160.0, y: 0.0, width: 20.0, height: 20.0)
        )
        blackSquare.backgroundColor = UIColor.black
        containerView.addSubview(blackSquare)
        
        let circle = UIView(
            frame: CGRect(x: 0.0, y: 0.0, width: 64.0, height: 64.0)
        )
        circle.center = containerView.center
        circle.backgroundColor = UIColor.blue
        circle.layer.borderColor = UIColor.blue.cgColor
        circle.layer.cornerRadius = 32.0
        circle.layer.borderWidth = 2.0
        containerView.addSubview(circle)
        
        
        let redSquare = UIView(frame: CGRect(x: 160, y: 45, width: 15, height: 15))
        redSquare.backgroundColor = UIColor.red
        containerView.addSubview(redSquare)
        
        UIView.animate(withDuration: 2.0, animations: { () -> Void in
            circle.backgroundColor = UIColor.white
            blackSquare.transform = CGAffineTransform(translationX: 0, y: 50)
            if (blackSquare.frame.intersects(redSquare.frame)) {
                blackSquare.transform = CGAffineTransform(translationX: 0, y: redSquare.frame.minY - blackSquare.frame.height)
            }
        })

        
        view.addSubview(containerView)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
