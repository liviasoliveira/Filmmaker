import Foundation
import UIKit

public class Erro {
    public let erro: String
    public let career: String
    public let feedback: String
    
    public init(erro: String, career: String, feedback:String){
        self.erro = erro
        self.career = career
        self.feedback = feedback
    }
    
    public static let shared =
        [
            Erro(erro: "Você já fez cenários?", career: "Cenografista", feedback: "Vamos precisar de um cenógrafo /nem outro momento."),
            Erro(erro: "Tente outra vez!", career: "Continuísta", feedback: "Vamos precisar de um continuísta em outro momento."),
            Erro(erro: "Você também edita?", career: "Montadora", feedback: "Mas acho melhor deixarmos para a próxima etapa."),
            Erro(erro: "Você gostou dela? ", career: "Direção de Fotografia", feedback: "Acho que essa não é a pessoa que estamos procurando!"),
            Erro(erro: "Figurino sempre é bom!", career: "Figurinista", feedback: "Mas vamos deixá-lo para a próxima etapa."),
            Erro(erro: "Música para viver!", career: "Trilheria", feedback: "Mas acho que essa não é a pessoa que estamos procurando!"),
            
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
    public let erro: String
    public let feedback: String
    
    public init(career: String, image: String, erro: String, feedback:String){
        self.name = career
        self.image = image
        self.erro = erro
        self.feedback = feedback
   
    }
    
    public static let shared =
        [
            Career(career: "Cenografista", image: "cenografista.png", erro: "Você já fez cenários?", feedback: "Vamos precisar de um cenógrafo em outro momento."),
            Career(career: "Continuísta", image: "continuista.png", erro: "Tente outra vez!", feedback: "Vamos precisar de um continuísta em outro momento."),
            Career(career: "Montadora", image: "montadora.png", erro: "Você também edita?", feedback: "Mas acho melhor deixarmos para a próxima etapa."),
            Career(career: "Direção de Fotografia", image: "diretorDeFotografia.png", erro: "Você gostou dela? ", feedback: "Acho que essa não é a pessoa que estamos procurando!"),
            Career(career: "Figurinista", image: "figurinista.png", erro: "Figurino sempre é bom!", feedback: "Mas vamos deixá-lo para a próxima etapa."),
            Career(career: "Trilheira", image: "trilheira.png", erro: "Música para viver!", feedback: "Mas acho que essa não é a pessoa que estamos procurando!"),
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
    public var erro: UILabel = UILabel()
    public var feedback: UILabel = UILabel()
    
    
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

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
