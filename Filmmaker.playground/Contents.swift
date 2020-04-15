//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import WebKit

let cfURL = Bundle.main.url(forResource: "SF-Compact-Display-Bold", withExtension: "otf")! as CFURL
CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)


class FirstViewController : UIViewController {
    
    let textoInicial = UILabel()
    let textoInicial2 = UILabel()
    
    
    @IBAction func touchedButtonPlay() {
        print("tocou botão dirigir filme")
        let vc = SecondViewController(screenType: .other(width: 750, height: 1024), isPortrait: true)
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
        
        textoInicial.frame = CGRect(x: 80, y: 100, width: 354, height: 117)
        textoInicial.text = "OI, SOU ROTEIRISTA \nE ME DIVIRTO FAZENDO \nFILMES!"
        textoInicial.numberOfLines = 3
        textoInicial.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        textoInicial.font = UIFont(name: "SF Compact Display", size: 30)
        
        
        textoInicial2.frame = CGRect(x: 80, y: 190, width: 400, height: 180)
        textoInicial2.text = "Mas preciso de sua ajuda \npara montar uma equipe.\nVocê pode dirigir esse \nfilme?"
        textoInicial2.numberOfLines = 4
        textoInicial2.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        textoInicial2.font = UIFont.systemFont(ofSize: 27, weight: UIFont.Weight.semibold)
        
        view.addSubview(telaInicial)
        view.addSubview(buttonPlay)
        view.addSubview(textoInicial2)
        view.addSubview(textoInicial)
        
        
        self.view = view
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.2, animations: {
            self.textoInicial.frame.origin.y = 50
        }, completion:{ finished in UIView.animate(withDuration: 0.9, animations: {
            self.textoInicial2.frame.origin.y = 165
        })})
        
       
        
        
        self.view.layoutIfNeeded()
        
    }
}

class SecondViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //var firstRound = true
    
    var cartaCollection: UICollectionView?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //vai pegar as cartas um a um no array de career
        let career = Career.shared[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Carta", for: indexPath) as? Carta else{
            fatalError("nao foi possivel acessar a celula")
        }
        
        cell.imageCareer.image = UIImage(named: career.image)
        cell.labelCareer.text = career.name
        cell.labelCareer.isHidden = true
        cell.imageCareer.isHidden = true
        
        //        if firstRound {
        //            cell.labelCareer.isHidden = true
        //            cell.imageCareer.isHidden = true
        //            cell.checkView.isHidden = true
        //        }
        
        //        cell.addTarget(self, action: #selector(virarCarta), for: .touchUpInside)
        //        self.view.frame = CGRect(x: career.x, career.y: y, width: 273, height: 321)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 273, height: 321)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //firstRound = false
        //let career = Career.shared[indexPath.row]
        guard let cell = collectionView.cellForItem(at: indexPath) as? Carta else{
            fatalError("nao foi possivel acessar a celula")
        }
        
        //        cell.imageCareer.image = UIImage(named: career.image)
        //        cell.labelCareer.text = career.name
        virarCarta(celula: cell)
        //collectionView.reloadItems(at: [indexPath])
    }
    func virarCarta(celula: Carta){
        
        let carta = celula
        
        if carta.isFacingDown {
            
            UIView.transition(with: celula, duration: 0.9, options: [.transitionFlipFromRight, .curveEaseOut], animations:{carta.view.setImage(carta.backgroundChosen, for: .normal)}                 )
            
            
//            carta.view.setImage(carta.backgroundChosen, for: .normal)
            carta.labelCareer.isHidden = false
            carta.imageCareer.isHidden = false
            carta.isFacingDown = false
            
        } else {
            if (carta.labelCareer.text == carreira){
                
                UIView.transition(with: celula, duration: 1.1, options: [.transitionFlipFromRight, .curveEaseOut], animations: { carta.labelCareer.font = UIFont(name: "SF Compact Display", size: 25);
                    carta.labelCareer.frame = CGRect(x: 67, y: 131, width: 155, height: 60);
                    carta.labelCareer.textAlignment = .left}                 )

                
                carta.imageCareer.isHidden = true
                carta.addSubview(carta.checkView)
                //self.checkView.isHidden = false
                //carta.labelCareer.isHidden = true
                atualizar()
                carta.isUserInteractionEnabled = false
                
                
            } else {
                
                UIView.transition(with: celula, duration: 0.9, options: [.transitionFlipFromLeft, .curveEaseOut], animations:{carta.view.setImage(carta.background, for: .normal)}                 )
                
//                carta.view.setImage(carta.background, for: .normal)
                carta.labelCareer.isHidden = true
                carta.imageCareer.isHidden = true
                carta.isFacingDown = true
                
                
            }
        }
    }
    
    func atualizar(){
        posicao = posicao + 1
        if posicao <= 5 {
            missao1.text = dados[posicao].number
            textomissao1.text = dados[posicao].text
            carreira = dados[posicao].career
            
            
        } else {
            let vc = ThirdViewController(screenType: .other(width: 750, height: 1024), isPortrait: true)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func touchedButton() {
        print("apertou na carta")
        
    }
    
    let dados: [Mission] = Mission.shared
    var posicao = 0
    //var carreira: String
    lazy var carreira: String = {
        return self.dados[self.posicao].career
    }()
    
    let missao1 = UILabel()
    let textomissao1 = UILabel()
    
    
    override func loadView() {
        print("load")
        
        let view = UIView()
        self.view = view
        view.backgroundColor = .white
        let imageHeader = UIImageView(frame: CGRect(x: -13 , y:-10, width: 776.62, height: 277))
        imageHeader.image = UIImage(named: "header.png")
        
        
        let imageBalao = UIImageView(frame: CGRect(x: 194, y:47.52, width: 486.8, height: 142.5))
        imageBalao.image = UIImage(named: "balao.png")
        
        
        missao1.frame = CGRect(x: 384, y: 61, width: 120, height: 30)
        missao1.text = dados[posicao].number
        missao1.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        missao1.font = UIFont.systemFont(ofSize: 25)
        missao1.font = UIFont(name: "SF Compact Display", size: 25)
        
        
        textomissao1.frame = CGRect(x: 240, y: 97, width: 430, height: 72)
        textomissao1.text = dados[posicao].text
        textomissao1.numberOfLines = 3
        textomissao1.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        textomissao1.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.semibold)
        
        //        let buttonCarta = UIButton()
        //        buttonCarta.frame = CGRect(x: 87, y: 277, width: 273, height: 321)
        //
        //        let imageButtonCarta = UIImage(named: "carta.png")
        //        buttonCarta.setImage(imageButtonCarta, for: .normal)
        //
        //        buttonCarta.addTarget(self, action: #selector(SecondViewController.touchedButton), for: .touchUpInside)
        
        
        //ColectionView
        let frame = CGRect(x:0, y:230, width: 730, height: 800)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 50, left:80, bottom:60, right:60)
        layout.itemSize = CGSize(width: 273, height: 321)
        layout.minimumLineSpacing = 22
        cartaCollection = UICollectionView(frame: frame, collectionViewLayout: layout)
        cartaCollection?.delegate = self
        cartaCollection?.dataSource = self
        self.cartaCollection?.backgroundColor = .white
        self.cartaCollection?.register(Carta.self, forCellWithReuseIdentifier: "Carta")
        
        cartaCollection?.alwaysBounceVertical = true
        
        view.addSubview(cartaCollection!)
        view.addSubview(imageHeader)
        view.addSubview(imageBalao)
        view.addSubview(missao1)
        view.addSubview(textomissao1)
        //        view.addSubview(buttonCarta)
        self.view = view
        print ("Chegou no fim da load view da SecondView")
        
    }
}

class ThirdViewController: UIViewController {
    
    let textovitoria = UILabel()
    let textovitoria2 = UILabel()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 750, height: 1024))
        imgBackground.image = UIImage(imageLiteralResourceName: "vitoria.png")
        
        
        textovitoria.frame = CGRect(x: 80, y: 143, width: 615, height: 53)
        textovitoria.text = "Nós ganhamos o Melhor Filme!"
        textovitoria.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        textovitoria.font = UIFont(name: "SF Compact Display", size: 44)
        
        
        textovitoria2.frame = CGRect(x: 130, y: 200, width: 600, height: 120)
        textovitoria2.text = "Não teríamos conseguido sem você.\n               Vamos ver como ficou?"
        textovitoria2.numberOfLines = 3
        textovitoria2.textColor = #colorLiteral(red: 0.0862745098, green: 0.1450980392, blue: 0.4117647059, alpha: 1)
        textovitoria2.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        
        let labelConfirmar = UILabel()
        labelConfirmar.frame = CGRect(x: 303, y: 902, width: 137, height: 36)
        labelConfirmar.text = "Confirmar"
        labelConfirmar.textColor = .white
        labelConfirmar.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.semibold)
        
        let buttonConfirmar = UIButton()
        buttonConfirmar.frame = CGRect(x: 265, y: 893, width: 210, height: 55)
        
        let imageButtonConfirmar = UIImage(named: "botao.png")
        buttonConfirmar.setImage(imageButtonConfirmar, for: .normal)
        
        buttonConfirmar.addTarget(self, action: #selector(ThirdViewController.touchedButtonConfirmar), for: .touchUpInside)
        
        view.addSubview(imgBackground)
        view.addSubview(textovitoria)
        view.addSubview(textovitoria2)
        view.addSubview(buttonConfirmar)
        view.addSubview(labelConfirmar)
        
        self.view = view
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.2, animations: {
            self.textovitoria.frame.origin.y = 90
        }, completion:{ finished in UIView.animate(withDuration: 1.2, animations: {
            self.textovitoria2.frame.origin.y = 160
        })})
        
        
        self.view.layoutIfNeeded()
        
    }
    
    @IBAction func touchedButtonConfirmar() {
        print("tocou botão confirmar")
        let vc = FourthViewController(screenType: .other(width: 750, height: 1024), isPortrait: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class FourthViewController: UIViewController, WKUIDelegate {
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let imgBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: 750, height: 1024))
        imgBackground.image = UIImage(imageLiteralResourceName: "film.png")
        
        let scene = UIImageView(frame: CGRect(x: 100, y: 266, width: 565, height: 370))
        scene.image = UIImage(imageLiteralResourceName: "scene.png")
        
        let labelRecomecar = UILabel()
        labelRecomecar.frame = CGRect(x: 310, y: 843, width: 153, height: 36)
        labelRecomecar.text = "Recomeçar"
        labelRecomecar.textColor = .white
        labelRecomecar.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.semibold)
        
        let buttonRecomecar = UIButton()
        buttonRecomecar.frame = CGRect(x: 279, y: 833, width: 210, height: 55)
        
        let imageButtonRecomecar = UIImage(named: "botao.png")
        buttonRecomecar.setImage(imageButtonRecomecar, for: .normal)
        
        buttonRecomecar.addTarget(self, action: #selector(FourthViewController.touchedButtonRecomecar), for: .touchUpInside)
        
        let playFilm = UIButton()
        playFilm.frame = CGRect(x: 338, y: 420, width: 66, height: 54)
        
        let imagePlayFilm = UIImage(named: "playFilm.png")
        playFilm.setImage(imagePlayFilm, for: .normal)
        
        playFilm.addTarget(self, action: #selector(FourthViewController.touchedButtonRecomecar), for: .touchUpInside)
        
        
        let webView: WKWebView!
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.ignoresViewportScaleLimits = true
        webView = WKWebView(frame: CGRect(x: 95, y: 266, width: 565, height: 370), configuration: webConfiguration)
        webView.uiDelegate = self
        
        let videoURL = URL(string: "https://www.youtube.com/embed/OcPRNIycl7U")!
        
        let videoRequest = URLRequest(url: videoURL)
        webView.load(videoRequest)
        
        
        view.addSubview(imgBackground)
//        view.addSubview(scene)
        view.addSubview(labelRecomecar)
        view.addSubview(buttonRecomecar)
        view.addSubview(labelRecomecar)
        view.addSubview(playFilm)
        view.addSubview(webView)
        
        self.view = view
        
    }
    
    @IBAction func touchedButtonRecomecar() {
        print("tocou botão recomeçar")
        let vc = FirstViewController(screenType: .other(width: 750, height: 1024), isPortrait: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// Present the view controller in the Live View window
public enum SFCompactDisplay: String {
    case typewriter = "SF-Compact-Display-Regular"
    case bold = "SF-Compact-Display-Bold"
    case semibold = "SF-Compact-Display-SemiBold.otf"
    public func font(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

let viewController = FirstViewController()
let vc = FirstViewController(screenType: .other(width: 750, height: 1024) , isPortrait: true)
let navigationController = UINavigationController(screenType: .other(width: 750, height: 1024) , isPortrait: true)
navigationController.pushViewController(vc, animated: true)
navigationController.navigationBar.isHidden = true
PlaygroundPage.current.liveView = navigationController.scale(to: 0.6)

