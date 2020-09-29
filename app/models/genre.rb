class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '専門家・プロ' },
    { id: 3, name: '著名人・インフルエンサー' },
    { id: 4, name: '人・ライフスタイル' },
    { id: 5, name: 'ニュース・語学' },
    { id: 6, name: 'ラジオ・トーク' }
  ]
end
