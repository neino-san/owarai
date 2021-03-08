5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "テスト太郎#{n + 1}",
    )
  end
  
User.all.each do |user|
  user.articles.create!(
    title: 'タイトル',
    body: 'テキストテキストテキストテキスト'
  )
end