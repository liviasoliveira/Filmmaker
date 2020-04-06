import Foundation
import UIKit

public class header{
    public let background: UIImageView = UIImageView()
    public var balao: UIImageView = UIImageView()
    public var titulo: UILabel = UILabel()
    public var texto: UILabel = UILabel()
    
    public init(){
        self.background.image = UIImage(named:"header.jpg")
        self.background.frame = CGRect(x: -5.55, y: -0.34, width: 776.62, height: 254.55)
        self.balao.image = UIImage(named:"")
        self.balao.frame =  CGRect(x: 187.16, y: 47.52, width: 486.84, height: 142.56)
        self.titulo.text = "Missão 1"
        self.texto.text = "Encontre a pessoa responsável por transformar o roteiro em vídeo através de cãmeras, lentes e iluminação"
        
        //        let header: UIImageView = UIImageView()
        //        let cartas: UIButton = UIButton()
        //        let missao: UILabel = UILabel()


        //        var headerMissao1: Header = Header()
        //        var headerMissao2: Header = Header()
        //        var headerMissao3: Header = Header()
        //        var headerMissao4: Header = Header()
        //        var headerMissao5: Header = Header()
        //        var headerMissao6: Header = Header()
        //        var listaHeaders = [Header()]
        //
        //        override func loadView(){
        //            for i in 1...6{
    }
}
