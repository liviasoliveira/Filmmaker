import Foundation
import UIKit

public class Career{
   public let name: String
   public let image: String
   public let x: CGFloat
   public let y: CGFloat

    public init(career: String, image: String, x: CGFloat, y: CGFloat){
        self.name = career
        self.image = image
        self.x = x
        self.y = y
        
    }

    public static let shared =
    [
     Career(career: "Cenografista", image: "cenografista.png", x: 87, y: 277),
     Career(career: "Continuísta", image: "continuista.png", x: 411, y: 277),
     Career(career: "Montadora", image: "montadora.png", x: 87, y: 622),
     Career(career: "Direção de Fotografia", image: "direcaoDeFotografia.png", x: 411, y: 622),
     Career(career: "Figurinista", image: "figurinista.png", x: 87, y: 967),
     Career(career: "Trilheira", image: "trilheira.png", x: 411, y: 967),
    ]
}

public class Carta: UICollectionViewCell {
    
    public var view: UIButton = UIButton()
    public var background: UIImage = UIImage(named: "carta.png")!
    public var backgroundChosen: UIImage = UIImage(named: "cartaEscolhida.png")!
    public var isFacingDown: Bool = true
    public var isCorrect: Bool = false
    public var labelCareer: UILabel = UILabel()
    public var imageCareer: UIImageView = UIImageView()
    public var checkView: UIImageView = UIImageView()
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.view.setImage(background, for: .normal)

        self.labelCareer.frame = CGRect(x: 472, y: 865, width: 146, height: 60)

        self.imageCareer.frame = CGRect(x: 491, y: 639, width: 120, height: 211)
        
        self.checkView.image = UIImage(named: "check.png")
        self.checkView.frame = CGRect(x: 616, y: 655, width: 40, height: 40)
        
        self.addSubview(UIImageView(image:background))
        self.contentView.addSubview(labelCareer)
        self.contentView.addSubview(imageCareer)
        self.view.addSubview(labelCareer)
        self.view.addSubview(checkView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func virarCarta(){
        if isFacingDown {
            self.view.setImage(backgroundChosen, for: .normal)
            self.labelCareer.isHidden = false
            self.imageCareer.isHidden = false
            isFacingDown = false
        } else {
            if isCorrect{
                self.imageCareer.isHidden = true
                self.checkView.isHidden = false
                
            } else {
                self.view.setImage(background, for: .normal)
                self.labelCareer.isHidden = true
                self.imageCareer.isHidden = true
                isFacingDown = true
            }
        }
    }
    
}
