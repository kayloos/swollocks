#<Encoding:UTF-8>

class PopulateStockYanks < ActiveRecord::Migration
  def self.up
    StockYank.create!(:symbol => "MAERSK-A.CO", :name => "A.P. Møller Mærsk A")
    StockYank.create!(:symbol => "MAERSK-B.CO", :name => "A.P. Møller Mærsk B")
    StockYank.create!(:symbol => "ALK-B.CO", :name => "ALK Abelló B")
    StockYank.create!(:symbol => "ALMB.CO", :name => "Alm. Brand")
    StockYank.create!(:symbol => "AMAG-N.CO", :name => "Amagerbanken")
    StockYank.create!(:symbol => "AURI-B.CO", :name => "Auriga Industries B")
    StockYank.create!(:symbol => "BO.CO", :name => "Bang & Olufsen")
    StockYank.create!(:symbol => "BAVA.CO", :name => "Bavarian Nordic")
    StockYank.create!(:symbol => "CARL-A.CO", :name => "Carlsberg A/S A")
    StockYank.create!(:symbol => "CARL-B.CO", :name => "Carlsberg A/S B")
    StockYank.create!(:symbol => "CHR.CO", :name => "Chr. Hansen Holding")
    StockYank.create!(:symbol => "COLO-B.CO", :name => "Coloplast B")
    StockYank.create!(:symbol => "DNORD.CO", :name => "D/S Norden")
    StockYank.create!(:symbol => "DFDS.CO", :name => "DFDS")
    StockYank.create!(:symbol => "DSV.CO", :name => "DSV")
    StockYank.create!(:symbol => "DCO.CO", :name => "Danisco")
    StockYank.create!(:symbol => "DANSKE.CO", :name => "Danske Bank")
    StockYank.create!(:symbol => "FLS.CO", :name => "FLSmidth & Co.")
    StockYank.create!(:symbol => "FLUG-B.CO", :name => "Flügger B")
    StockYank.create!(:symbol => "FPEPI.CO", :name => "Formuepleje Epikur")
    StockYank.create!(:symbol => "FPLIM.CO", :name => "Formuepleje LimiTTellus")
    StockYank.create!(:symbol => "FPPAR.CO", :name => "Formuepleje Pareto")
    StockYank.create!(:symbol => "FPPEN.CO", :name => "Formuepleje Penta")
    StockYank.create!(:symbol => "FPSAFE.CO", :name => "Formuepleje Safe")
    StockYank.create!(:symbol => "G4S.CO", :name => "G4S plc")
    StockYank.create!(:symbol => "GN.CO", :name => "GN Store Nord")
    StockYank.create!(:symbol => "GEN.CO", :name => "Genmab")
    StockYank.create!(:symbol => "GES.CO", :name => "Greentech Energy Systems")
    StockYank.create!(:symbol => "GRLA.CO", :name => "Grønlandsbanken")
    StockYank.create!(:symbol => "IC.CO", :name => "IC Companys")
    StockYank.create!(:symbol => "JDAN.CO", :name => "Jeudan")
    StockYank.create!(:symbol => "JYSK.CO", :name => "Jyske Bank A/S")
    StockYank.create!(:symbol => "KBHL.CO", :name => "Københavns Lufthavne")
    StockYank.create!(:symbol => "LUN.CO", :name => "Lundbeck")
    StockYank.create!(:symbol => "LASP.CO", :name => "Lån og Spar Bank")
    StockYank.create!(:symbol => "MOLS.CO", :name => "Mols-Linien")
    StockYank.create!(:symbol => "MT-B.CO", :name => "Monberg & Thorsen B")
    StockYank.create!(:symbol => "NKT.CO", :name => "NKT Holding")
    StockYank.create!(:symbol => "NEUR.CO", :name => "NeuroSearch")
    StockYank.create!(:symbol => "NDA-DKK.CO", :name => "Nordea Bank AB")
    StockYank.create!(:symbol => "NORDJB.CO", :name => "Nordjyske Bank")
    StockYank.create!(:symbol => "NOVO-B.CO", :name => "Novo Nordisk B")
    StockYank.create!(:symbol => "NZYM-B.CO", :name => "Novozymes B")
    StockYank.create!(:symbol => "NRSU.CO", :name => "Nørresundby Bank")
    StockYank.create!(:symbol => "PARKEN.CO", :name => "PARKEN Sport & Entertainment")
    StockYank.create!(:symbol => "PNDORA.CO", :name => "Pandora A/S")
    StockYank.create!(:symbol => "PAAL-B.CO", :name => "Per Aarsleff B")
    StockYank.create!(:symbol => "RELLA.CO", :name => "Rella Holding A/S")
    StockYank.create!(:symbol => "RILBA.CO", :name => "Ringkjøbing Landbobank")
    StockYank.create!(:symbol => "ROCK-A.CO", :name => "Rockwool Int. A")
    StockYank.create!(:symbol => "ROCK-B.CO", :name => "Rockwool Int. B")
    StockYank.create!(:symbol => "SAS-DKK.CO", :name => "SAS")
    StockYank.create!(:symbol => "SAT.CO", :name => "Satair")
    StockYank.create!(:symbol => "SCHO.CO", :name => "Schouw & Co.")
    StockYank.create!(:symbol => "SIM.CO", :name => "SimCorp")
    StockYank.create!(:symbol => "SJGR.CO", :name => "Sjælsø Gruppen")
    StockYank.create!(:symbol => "SOLAR-B.CO", :name => "Solar B")
    StockYank.create!(:symbol => "SPNFI.CO", :name => "Spar Nord Formueinvest")
    StockYank.create!(:symbol => "SPFA.CO", :name => "Sparekassen Faaborg")
    StockYank.create!(:symbol => "SYDB.CO", :name => "Sydbank")
    StockYank.create!(:symbol => "TDC.CO", :name => "TDC A/S")
    StockYank.create!(:symbol => "TKDV.CO", :name => "TK Development")
    StockYank.create!(:symbol => "TORM.CO", :name => "DS TORM")
    StockYank.create!(:symbol => "THRAN.CO", :name => "Thrane & Thrane")
    StockYank.create!(:symbol => "TIV.CO", :name => "Tivoli A/S")
    StockYank.create!(:symbol => "TRYG.CO", :name => "Tryg A/S")
    StockYank.create!(:symbol => "VWS.CO", :name => "Vestas Wind Systems")
    StockYank.create!(:symbol => "VJBA.CO", :name => "Vestjysk Bank")
    StockYank.create!(:symbol => "WDH.CO", :name => "William Demant Holding")
    StockYank.create!(:symbol => "ZEAL.CO", :name => "Zealand Pharma")
    StockYank.create!(:symbol => "ZEAL-N.CO", :name => "Zealand Pharma N")
    StockYank.create!(:symbol => "OSSR-DKK.CO", :name => "Össur hf.")
    StockYank.create!(:symbol => "YHOO", :name => "Yahoo")
  end

  def self.down
  end
end
