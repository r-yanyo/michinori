

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create administor
@user = User.create!(name: "admin", email: "honma.ryosuke@gmail.com", password: "foobar", remember_token: User.encrypt(User.new_remember_token))
10.times do |j|
  @user.posts.create!(title: 'ユーザ1のサンプルポスト', content: 'ユーザ1のサンプルのコンテンツです。', author: @user.name)
end

2.upto 10 do |i|
  @user = User.create!(email: "user"+i.to_s()+"@example.com", password: "foobar", name: "user"+i.to_s(), remember_token: User.encrypt(User.new_remember_token))

  10.times do |j|
    @user.posts.create!(title: 'ユーザ'+i.to_s()+'のサンプルポスト', content: 'ユーザ'+i.to_s()+'のサンプルのコンテンツです。', author: @user.name)
  end

end

50.times do |i|
  Post.create!(title: 'Sample Post'+i.to_s(), content: 'Sample Content')
end
50.times do |i|
  Post.create!(title: 'サンプルポスト'+i.to_s(), content: 'サンプルのコンテンツです。')
end
Post.create!(title: 'TOEIC700点以上取れるようになるまで', content: '19歳 学生

  勉強開始前のTOEICの点数は540点。学校の授業を真面目に受けていたので540点は取れた。TOEICの単語に関しては、「金のフレーズ」が一番良いと思う。単語の勉強法は英単語とその意味をノートにひたすら書き、覚えていなかったものだけ再び同じ作業をするという方法。金のフレーズは目標点数ごとに覚える単語が分かれているが、目標点数800点の単語までは覚えた。公式問題集は6回分やった。

  まとめるとTOEICの勉強としてやったことは、金のフレーズと公式問題集6回分。これは結構勉強時間としては結構少ないと思う。ただ、私は他にもやっていることがあって、洋楽を聴いたり、英語のアニメを見たり、英語のPod castを聞いたり、サッカーの実況を英語で聞いたりしていた。つまり、自分の好きなことを英語化する。その方が勉強をするより楽だし、モチベーションも上がり易いと思う。私の周りのTOEICスコアが高い人も自分の好きなことを英語化している人が多い気がします。

  こんな感じで勉強した結果、点数が540点から730点に上がりました。参考になれば幸いです。')
Post.create!(title: '私が道のりアプリを作れるようになるまで', content: '21歳 学生

  昔からインターネットやゲームが好きで、それがどうやって作られているのか知りたかったし、見る側ではなく作る側にまわりたかったのでなんとなく普通高校ではなく高専に入った。

  高専時代はC言語でプログラミングの基礎やアルゴリズムを学んだものの、Webアプリケーションを作れる気は到底しなかった（高専に入ればWebアプリぐらい作れるようになるんじゃね？と勝手に思っていた）。というか私が入った高専は電気情報工学科という名前だが、どちらかというと電気系寄りだった。

  高専4年の時にこのままじゃいかんと思い、駅の本屋に通ってひたすら本を探したり勉強方法をネットで調べまくった。この時はWebアプリだけではなく、ゲームも作れるようになりたいと思っていた。やりたいことが広く浅すぎて、色んなことに手を出しては中途半端に終わっていた気がする。スマホアプリに手を出さなかったのは、節約のためガラケーを使っていたのであまりスマホアプリに馴染みが無かった。
  
  ネットで学習方法を調べるとプログラミング学習サイトがいくつかあることを知り、いくつかやってみることにした。「ドットインストール」「code academy」「Free Code Camp」「Schoo」など色々試した（今思えば、色々つまみ食いするより1つのサイトに絞った方が良かったなと思う）。高専ではほんの少しだけHTMLの勉強をしたが、エディタはtera padで補完機能も無く完全手打ちで書いたので、「こんなメンドくさいことをやってWebページが作られているのか・・・」と思っていた。code academyでCSSの勉強をした時に、CSSだけでこんなに綺麗なページが作れるのかと感動し、自分でもWebページを作ってみようという意欲が出た。Sublime Textというエディタを発見し、補完機能やスニペットに感動する。だんだん自分でもWeb上にあるようなサイトが作れる気がしてくる。HTML, CSS,と続いたので次はJavaScriptを勉強する。プログラミング学習サイトでJavaScriptを勉強している途中に「Node.js」を知り、サーバサイドでJavaScriptを書けることを知る。Node.jsを知ることが出来たのでは幸運だったなと思う。この時はWebの知識があまり無くサーバサイドとは何なのか良く分かっていなかった。高専卒業、大学入学。

  大学は高専と違い情報系だったが、結局高専と同じく授業を聞いているだけではアプリを作れるようには到底なれないとすぐに悟った。高専の時に発見した「Node School」でNode.jsを勉強する。サイトに書いてある手順通りNode.jsでサーバを立ててレスポンスを返してみたが、Webの知識が無いので何が起きているのかよく理解できなかった。Webの知識をつけるべく「Webを支える技術」という本を読む。この本を読むことでWebページがどうやってブラウザに表示されているのか分かってきた。Node.jsを勉強することでサーバサイドプログラミングに興味が湧き、そのフレームワークである「Express」を勉強し始める。この辺から何を勉強すればWebアプリが作れるのかやっと方向性が分かってきた。Expressで簡単なアプリが作れるようになったのでハッカソンに参加してみた。

  　と、このように私は簡単なWebアプリを作るために2年程の歳月をかけた。これは多分他の人よりも長いし苦労していると思う。最近はWebアプリを作るためには「Progate」という学習サイトの評判が非常に良いらしいです。Node.jsを学ぶなら「N予備校」Webアプリケーションコースがお勧めです。私も受講しました。私が当時使っていた学習サイトは英語のサイトばかりで大変だった記憶があります。その分英語読解力が鍛えられた感はありますが。

  私は何もかも分からない状態からWebアプリ作成を学んだので、「勉強する内容」よりも「何を勉強すれば良いのか」を探すのに時間がかかってしまった気がします。この体験を見た方には私よりも短い時間で苦労せずにWebアプリを作れるようになって欲しいです！')
