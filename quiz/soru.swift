//
//  soru.swift
//  quiz
//
//  Created by samet sahin on 5.01.2017.
//  Copyright © 2017 samet sahin. All rights reserved.
//

import UIKit

class question: NSObject {
    
    private let _soru :String
    private let _aSıkkı : String
    private let _bSıkkı : String
    private let _cSıkkı : String
    private let _dSıkkı : String
    private let _dogruSık : String
    private let _resim : String
    
    init(soruInit : String , aSıkkıInit : String ,bSıkkıInit : String,cSıkkıInit : String,dSıkkıInit : String,dogruSıkInit : String) {
        self._soru = soruInit
        self._aSıkkı = aSıkkıInit
        self._bSıkkı = bSıkkıInit
        self._cSıkkı = cSıkkıInit
        self._dSıkkı = dSıkkıInit
        self._dogruSık = dogruSıkInit
        self._resim = ""
    }
    
    init(soruInit : String , aSıkkıInit : String ,bSıkkıInit : String,cSıkkıInit : String,dSıkkıInit : String,dogruSıkInit : String , resim : String) {
        self._soru = soruInit
        self._aSıkkı = aSıkkıInit
        self._bSıkkı = bSıkkıInit
        self._cSıkkı = cSıkkıInit
        self._dSıkkı = dSıkkıInit
        self._dogruSık = dogruSıkInit
        self._resim = resim
    }
    func getResim () -> String
    {
    return _resim
    }
    
    func getSoru () -> String
    {
        return _soru
    }
    
    func getAsıkkı () -> String
    {
        return _aSıkkı
    }
    func getBsıkkı () -> String
    {
        return _bSıkkı
    }
    func getCsıkkı () -> String
    {
        return _cSıkkı
    }
    func getDsıkkı () -> String
    {
        return _dSıkkı
    }
    func getDogruCevap () -> String
    {
        return _dogruSık
    }
    
}
