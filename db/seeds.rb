if Rails.env == 'development'
    (1..100).each do |i|
        Post.create(name: "ユーザ#{i}",content: "本文#{i}")
    end
end