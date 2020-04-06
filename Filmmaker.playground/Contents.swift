//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

let cfURL = Bundle.main.url(forResource: "SF-Compact-Display-Bold", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

//let cfURL2 = Bundle.main.url(forResource: "SF-Compact-Display-Semibold", withExtension: "otf")!
//CTFontManagerRegisterFontsForURL(cfURL2 as CFURL, CTFontManagerScope.process, nil)

//for name in UIFont.familyNames{
//    print(name)
//}

public class Carta: UICollectionViewCell {
    public let background: UIImageView = UIImageView()
    public var profissao: UILabel = UILabel()
    public var icone: UIImageView = UIImageView()
    
    public override init(frame: CGRect){
        super.init(frame:frame)
        self.background.image = UIImage(named: "carta.png")
        self.background.frame = CGRect(x: 87, y: 277, width: 273, height: 321)
        self.profissao.text = "Direção de Fotografia"
        self.icone.image = UIImage(named:"diretorDeFotografia")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FirstViewController : UIViewController {
    
    @IBAction func touchedButtonPlay() {
        print("tocou botão dirigir filme")
        let vc = SecondViewController(screenType: .other(width: 750, height: 1024), isPortrait: true)
        //navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        let telaInicial = UIImageView(frame: CGRect(x: 0, y: 0, width: 750, height: 1024))
        telaInicial.image = UIImage(imageLiteralResourceName: "telaInicial.png")
        
        let buttonPlay = UIButton()
        buttonPlay.frame = CGRect(x: 342, y: 799, width: 107, height: 94)
        
        let imagePlay = UIImage(named: "botaoPlay.png")!
        buttonPlay.setImage(imagePlay, for: .normal)
        
        buttonPlay.addTarget(self, action: #selector(FirstViewController.touchedButtonPlay), for: .touchUpInside)
        
        let textoInicial = UILabel()
        textoInicial.frame = CGRect(x: 80, y: 60, width: 354, height: 117)
        textoInicial.text = "OI, SOU ROTEIRISTA \nE ME DIVIRTO FAZENDO \nFILMES!"
        textoInicial.numberOfLines = 3
        textoInicial.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        //        textoInicial.font = UIFont.systemFont(ofSize: 30)
        textoInicial.font = UIFont(name: "SF Compact Display", size: 30)
        
        let textoInicial2 = UILabel()
        textoInicial2.frame = CGRect(x: 80, y: 190, width: 400, height: 150)
        textoInicial2.text = "Mas preciso de sua ajuda \npara montar uma equipe.\nVocê pode dirigir esse \nfilme?"
        textoInicial2.numberOfLines = 4
        textoInicial2.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        textoInicial2.font = UIFont.systemFont(ofSize: 27)
        //        textoInicial2.font = SFCompactDisplay.semibold.font(size:27)
        //        textoInicial2.font = UIFont(name: "SF Compact Display", size: 27)
        
        view.addSubview(telaInicial)
        view.addSubview(buttonPlay)
        view.addSubview(textoInicial)
        view.addSubview(textoInicial2)
        self.view = view
    }
}


class SecondViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cartaCollection: UICollectionView?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Carta", for: indexPath) as? Carta else{
            fatalError("nao foi possivel acessar a celula")
            
        }
        cell.profissao.text = "Diretor de Fotografia"
        return cell
    }
    
    
    @IBAction func touchedButton() {
        print("apertou na carta")
    }
    
    override func loadView() {
        print("load")
        
        let view = UIView()
        self.view = view
        view.backgroundColor = .white
        let imageHeader = UIImageView(frame: CGRect(x: -13 , y:-10, width: 776.62, height: 277))
        imageHeader.image = UIImage(named: "header.png")
        
        
        let imageBalao = UIImageView(frame: CGRect(x: 194, y:47.52, width: 486.8, height: 142.5))
        imageBalao.image = UIImage(named: "balao.png")
        
        let missao1 = UILabel()
        missao1.frame = CGRect(x: 384, y: 61, width: 120, height: 30)
        missao1.text = "Missão 1"
        missao1.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        missao1.font = UIFont.systemFont(ofSize: 25)
        missao1.font = UIFont(name: "SF Compact Display", size: 25)
        
        let textomissao1 = UILabel()
        textomissao1.frame = CGRect(x: 245, y: 97, width: 430, height: 72)
        textomissao1.text = "Encontre a pessoa responsável por transformar \no roteiro em vídeo através de cãmeras, lentes \ne iluminação."
        textomissao1.numberOfLines = 3
        textomissao1.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        textomissao1.font = UIFont.systemFont(ofSize: 20)
        
        let buttonCarta = UIButton()
        buttonCarta.frame = CGRect(x: 87, y: 277, width: 273, height: 321)
        
        let imageButtonCarta = UIImage(named: "carta.png")
        buttonCarta.setImage(imageButtonCarta, for: .normal)
        
        buttonCarta.addTarget(self, action: #selector(SecondViewController.touchedButton), for: .touchUpInside)
        
        let frame = self.view.frame
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        cartaCollection = UICollectionView(frame: frame, collectionViewLayout: layout)
        cartaCollection?.delegate = self
        cartaCollection?.dataSource = self
        self.cartaCollection?.backgroundColor = .white
        self.cartaCollection?.register(Carta.self, forCellWithReuseIdentifier: "Carta")
        
        cartaCollection?.alwaysBounceVertical = false
        
        view.addSubview(cartaCollection!)
        view.addSubview(imageHeader)
        view.addSubview(imageBalao)
        view.addSubview(missao1)
        view.addSubview(textomissao1)
        view.addSubview(buttonCarta)
        self.view = view
        print ("Chegou no fim da load view da SecondView")
        
    }
}

// Present the view controller in the Live View window
public enum SFCompactDisplay: String {
    case typewriter = "SF-Compact-Display"
    case bold = "SF-Compact-Display-Bold"
    case semibold = "SF-Compact-Display-SemiBold"
    public func font(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

let viewController = FirstViewController()
let vc = FirstViewController(screenType: .other(width: 750, height: 1024) , isPortrait: true)
let navigationController = UINavigationController(screenType: .other(width: 750, height: 1024) , isPortrait: true)
navigationController.pushViewController(vc, animated: true)
navigationController.navigationBar.isHidden = true
PlaygroundPage.current.liveView = navigationController.scale(to: 0.4)
