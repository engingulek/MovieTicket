import Foundation
import UIKit
import SnapKit
import CommenUIKit
import ThemeKit
import ModelKit


protocol ChooseSeatViewDelegate {
    func payNowButtonTappedDelegate()
    func chooseSeat(chooseSeatInfo:SelectedSeat)
}

final class ChooseSeatView : UIView {
    var delegate :  ChooseSeatViewDelegate?
    private var seatCount : Int = 0
    private lazy var movieNameLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.primaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
      
        return label
    }()
    
    private lazy var moviedateLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
       
        return label
    }()
    
    private lazy var ticketAmountLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        return label
    }()
    
    private lazy var movieLanguageLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
       
        return label
    }()
    
    private lazy var hourcollectionview : UICollectionView  = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 5,
                                 height:UIScreen.main.bounds.height / 15 )
        layout.scrollDirection = .horizontal
        let  collectionview = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        collectionview.register(
            OnlyLabelCVC.self,
            forCellWithReuseIdentifier: OnlyLabelCVC.identifier)
        
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryBackground)
        return collectionview
    }()
    
    private lazy var screneLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.secondaryFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.text = Theme.theme.themeText.scene
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var seatFullUIView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = Radius.small.rawValue
        return view
        
    }()
    
    private lazy var seatFullLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.text = Theme.theme.themeText.full
        label.textAlignment = .center
        return label
    }()
    
    
    
    private lazy var seatChosenUIView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex:Theme.theme.themeColor.thirdBack)
        view.layer.cornerRadius = Radius.small.rawValue
        return view
        
    }()
    
    private lazy var seatChoseLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.text = Theme.theme.themeText.chosen
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var seatEmptyUIView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        view.layer.cornerRadius = Radius.small.rawValue
        return view
        
    }()
    
    private lazy var seatEmptyLabel : UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellSubLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.text = Theme.theme.themeText.empty
        label.textAlignment = .center
        return label
    }()
    
    private lazy var choosenSeatsLabel :  UILabel = {
        let label = UILabel()
        label.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        label.textColor = UIColor(hex:Theme.theme.themeColor.primaryLabel)
        label.numberOfLines = .zero
        label.textAlignment = .center
        return label
    }()
    
    
    
    private lazy var payNowButton : UIButton = {
        let button = UIButton()
        button.setTitle(Theme.theme.themeText.payNowButton, for: .normal)
        button.setTitleColor(UIColor(hex:Theme.theme.themeColor.primaryLabel), for: .normal)
        button.titleLabel?.font = Theme.theme.themeFont.cellLabelFont.boldVersion
        button.backgroundColor = UIColor(hex:Theme.theme.themeColor.thirdBack)
        button.titleLabel?.textAlignment = .left
        button.layer.cornerRadius = Radius.small.rawValue
        button.addAction(payButtonTapped, for: .touchUpInside)
        return  button
    }()
    
   private lazy var mainStackView : UIStackView = {
     let stackView = UIStackView()
     stackView.axis = .vertical
     stackView.alignment = .fill
     stackView.distribution = .fillEqually
     stackView.spacing = 10
     return stackView
     }()
     
   
    private lazy var payButtonTapped  :UIAction = UIAction { _ in
        self.delegate?.payNowButtonTappedDelegate()
        
    }
    
    func prepareCollectionView(view:ChooseSeatViewController){
        hourcollectionview.delegate = view
        hourcollectionview.dataSource = view
    }

    func reloadDataCollectionView(){
        hourcollectionview.reloadData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    func seatDesing(seatInfo:[SeatsInfo],selectedInfo:[SelectedSeat]){
        var chosen = "\(Theme.theme.themeText.chosenSeat) : "
        for seat in selectedInfo {
            chosen += "(\(seat.row),\(seat.col))"
        }
        choosenSeatsLabel.text = chosen
        seatCount = selectedInfo.count
    
        mainStackView.arrangedSubviews.forEach {  mainStackView.removeArrangedSubview($0) }
            for rowIndex in 1...8 {
                let rowStackView = UIStackView()
                rowStackView.axis = .horizontal
                rowStackView.alignment = .fill
                rowStackView.distribution = .fillEqually
                rowStackView.spacing = 10
                
                for columnIndex in 1...10 {
                    let squareView = UIView()
                    let seatTypes = seatInfo.filter( {
                        $0.col == columnIndex && $0.row == rowIndex
                    })
                    
                    let selectedControl = selectedInfo.contains(where: {
                        $0.col == columnIndex && $0.row == rowIndex
                    })
                    if !seatTypes.isEmpty  {
                        if seatTypes[0].status == "disable"{
                            squareView.backgroundColor = UIColor(hex: Theme.theme.themeColor.primaryBackground)
                        }else{
                            squareView.backgroundColor = UIColor.red
                        }
                      
                    }else if selectedControl{
                        squareView.backgroundColor = UIColor.green
                    }else{
                        squareView.backgroundColor = UIColor.white
                    }
                    
                    squareView.layer.cornerRadius = Radius.small.rawValue
                   
                    rowStackView.addArrangedSubview(squareView)
                    
                    
                    let tapGestureRecognizer = UITapGestureRecognizer(
                        target: self,
                        action: #selector(squareTapped(_:)))
                    squareView.addGestureRecognizer(tapGestureRecognizer)
                    // Exmaple
                    /// row:  2,  column:3   -tag = 2 * 100  + 3 = 203
                    squareView.tag = rowIndex * 100 + columnIndex
                }
                
                mainStackView.addArrangedSubview(rowStackView)
            }
    }
      @objc func squareTapped(_ sender: UITapGestureRecognizer) {
          if let tappedView = sender.view {
              // Exmaple
              /// row:  2,  column:3   -tag = 2 * 100  + 3 = 203
              /// 203 / 100 = 2 = Row
              /// 203 % 100 = 3 = Column
              let rowIndex = tappedView.tag / 100
              let columnIndex = tappedView.tag % 100
              let choseSeat = SelectedSeat(row: rowIndex, col: columnIndex)
              self.delegate?.chooseSeat(chooseSeatInfo: choseSeat)
          }
      }
    
    func configureMovieInfo(info:ChooseHallAndSessionInfo){
        movieNameLabel.text = info.movieName
        moviedateLabel.text =  info.date
        movieLanguageLabel.text = info.language.type
        ticketAmountLabel.text = "$\(info.ticketAmount)"
       
    }
    
    private func configureUI(){

        addSubview(movieNameLabel)
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(moviedateLabel)
        moviedateLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        addSubview(ticketAmountLabel)
        ticketAmountLabel.snp.makeConstraints { make in
            make.top.equalTo(moviedateLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        
        addSubview(movieLanguageLabel)
        movieLanguageLabel.snp.makeConstraints { make in
            make.top.equalTo(ticketAmountLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        
        addSubview(screneLabel)
        screneLabel.snp.makeConstraints { make in
            make.top.equalTo(movieLanguageLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        addSubview(mainStackView)
            mainStackView.snp.makeConstraints { make in
                make.top.equalTo(screneLabel.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(UIScreen.main.bounds.height / 3)
            }
        
        
        
        addSubview(seatFullUIView)
        seatFullUIView.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        addSubview(seatFullLabel)
        seatFullLabel.snp.makeConstraints { make in
            make.top.equalTo(seatFullUIView.snp.top)
            make.leading.equalTo(seatFullUIView.snp.trailing).offset(5)
        }
        
        
        addSubview(seatChosenUIView)
        seatChosenUIView.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(15)
            make.leading.equalTo(seatFullLabel.snp.trailing).offset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        addSubview(seatChoseLabel)
        seatChoseLabel.snp.makeConstraints { make in
            make.top.equalTo(seatChosenUIView.snp.top)
            make.leading.equalTo(seatChosenUIView.snp.trailing).offset(5)
            
        }
    
        addSubview(seatEmptyUIView)
        seatEmptyUIView.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(15)
            make.leading.equalTo(seatChoseLabel.snp.trailing).offset(20)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        addSubview(seatEmptyLabel)
        seatEmptyLabel.snp.makeConstraints { make in
            make.top.equalTo(seatEmptyUIView.snp.top)
            make.leading.equalTo(seatEmptyUIView.snp.trailing).offset(5)
            
        }
        
        addSubview(hourcollectionview)
        hourcollectionview.snp.makeConstraints { make in
            make.top.equalTo(seatEmptyUIView.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(80)
        }
        
        addSubview(payNowButton)
        payNowButton.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
        
        addSubview(choosenSeatsLabel)
        choosenSeatsLabel.snp.makeConstraints { make in
            make.top.equalTo(hourcollectionview.snp.bottom).offset(5)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(payNowButton.snp.top).offset(-5)
            make.height.equalTo(80)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
