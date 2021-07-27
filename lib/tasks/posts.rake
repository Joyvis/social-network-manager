namespace :posts do
  desc "Initialize Redis with posts before run app"
  task initialize: :environment do
    result = Posts::Update.call

    if result.success?
      puts 'Post were imported correctly'
    else
      puts "Something went wrong - #{result.message}"
    end
  end

end
