import Foundation
import UIKit

public class Error {
    public let error: String
    public let career: String
    
    public init(error: String, career: String){
        self.error = error
        self.career = career
    }
    
    public let shared =
        [
            Error(error: "Você gostou dela? \nAcho que essa não é a pessoa que /nestamos procurando!", career: "Direção de Fotografia"),
            Error(error: "Tente outra vez! \nVamos precisar de um continuísta /nem outro momento.", career: "Continuísta"),
            Error(error: "Figurino sempre é bom! \nMas vamos deixá-lo para a próxima /netapa.", career: "Figurinista"),
            Error(error: "Você já fez cenários? \nVamos precisar de um cenógrafo /nem outro momento.", career: "Cenografista"),
            Error(error: "Música para viver! \nMas acho que essa não é a pessoa /nque estamos procurando!", career: "Trilheria"),
            Error(error: "Você também edita? \nMas acho melhor deixarmos para /na próxima etapa.", career: "Montadora"),
    ]
}


public class Mission {
    public let number: String
    public let text: String
    public var career: String
    
    public init(number: String, text: String, career: String){
        self.number = number
        self.text = text
        self.career = career
    }
    //tem q colocar a localizacao da label missao e label text ok
    public static let shared =
            [
                Mission(number: "Missão 1", text: "Encontre a pessoa responsável por transformar \no roteiro em vídeo através de cãmeras, lentes \ne iluminação.", career: "Direção de Fotografia"),
                Mission(number: "Missão 2", text: "Encontre a pessoa responsável por cuidar do \nenredo e das imagens no filme para que não \naconteçam falhas na montagem.", career: "Continuísta"),
                Mission(number: "Missão 3", text: "Encontre a pessoa que ajuda a construir o personagem escrito no roteiro através de roupas que serão usadas em cena.", career: "Figurinista"),
                Mission(number: "Missão 4", text: "Encontre a pessoa que cria cenários em estúdio \ne adapta espaços para serem usados no set \nde filmagem.", career: "Cenografista"),
                Mission(number: "Missão 5", text: "Encontre a pessoa que produz todos os efeitos \nsonoros e diálogos para gerar cenas dramáticas \ndesejadas pelo diretor.", career: "Trilheira"),
                Mission(number: "Missão 6", text: "Encontre a pessoa que seleciona as imagens \nde rodagem e edita os efeitos sonoros para \ndar sentido à narrativa.", career: "Montadora"),
        ]
    
}



//tem q criar a funcao pras missoes mudararem com a carta certa e a label de erro aparecer
//tem q ajustar as fontes, tamanhos e posicoes das coisas, individualizar as posicoes, como fazer?

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
            Career(career: "Direção de Fotografia", image: "diretorDeFotografia.png", x: 411, y: 622),
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
        
        self.labelCareer.frame = CGRect(x: 59, y: 255, width: 155, height: 60)
        labelCareer.font = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.semibold)
        labelCareer.textAlignment = .center
        labelCareer.numberOfLines = 2
        labelCareer.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        
        self.imageCareer.frame = CGRect(x: 0, y: 0, width: 273, height: 264)
        
        self.checkView.image = UIImage(named: "check.png")
        self.checkView.frame = CGRect(x: 211, y: 25, width: 40, height: 40)
        
        self.addSubview(UIImageView(image:background))
        self.addSubview(labelCareer)
        self.addSubview(imageCareer)
        //self.addSubview(checkView)
        
        //        self.bringSubviewToFront(contentView)
        //        self.contentView.bringSubviewToFront(imageCareer)
        //        self.contentView.bringSubviewToFront(labelCareer)
        //        self.contentView.bringSubviewToFront(checkView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public func virarCarta(){
//        if isFacingDown {
//            self.view.setImage(backgroundChosen, for: .normal)
//            self.labelCareer.isHidden = false
//            self.imageCareer.isHidden = false
//            isFacingDown = false
//            
//        } else {
//            if isCorrect{
//                self.imageCareer.isHidden = true
//                self.addSubview(checkView)
//                //self.checkView.isHidden = false
//                self.labelCareer.isHidden = true
//                
//            } else {
//                self.view.setImage(background, for: .normal)
//                self.labelCareer.isHidden = true
//                self.imageCareer.isHidden = true
//                isFacingDown = true
//            }
//        }
//    }
    
}
