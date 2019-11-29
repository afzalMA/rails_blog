30.times do
    article = Article.new(summary:Faker::Lorem.paragraph,
                        headline:Faker::Lorem.unique.sentence,
                        body:Faker::Lorem.paragraph,
                        conclusion:Faker::Lorem.paragraph,
                        ticker:Faker::Lorem.sentence)

        if article.save
            article.friendly_id = article.headline.gsub(/\s/ , '-')
            article.save
        end
end