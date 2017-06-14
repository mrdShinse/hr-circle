# frozen_string_literal: true

namespace :dev do
  namespace :data do
    desc 'initialize first organization'
    task primary: :environment do
      begin
        org = Organization.find_or_initialize_by(id: 1)
        if org.new_record?
          org.attributes = {
            name: 'my company'
          }
          org.save!
          puts "organization ##{org.id} inserted."
        end

        circles = []
        5.times do |index|
          circle = Circle.find_or_initialize_by(id: index)
          circles << circle
          next unless circle.new_record?

          circle.attributes = { name: "Team ##{index}" }
          circles[0].children.push circle if index == 1
          circles[0].children.push circle if index == 2
          circles[1].children.push circle if index == 3
          circles[0].children.push circle if index == 4

          circle.save!
          puts "circle ##{circle.id} inserted."
        end

        10.times do |index|
          person = Person.find_or_initialize_by(id: index)
          next unless person.new_record?

          person.attributes = {
            name:  "Person ##{index}",
            email: "dummy#{index}@dummy.com",
            password: "hrcircle#{index}"
          }
          if index.zero?
            person.admin!
            circles[0].members.push
          end
          circles[0].members.push person if index % 3 == 1
          circles[1].members.push person if index % 3 == 2

          person.save!
          puts "person ##{person.id} inserted."
        end

        content = <<-CONTENT
                    alert('wanted!');
                    <h2>分散型SNSの開発担当者募集中！</h2>
                    http://localhost:3000/
                    https://localhost:3000/
                  CONTENT
        2.times do |index|
          offer = JobOffer.find_or_initialize_by(id: index)
          next unless offer.new_record?

          offer.attributes = {
            circle_id: (index % Person.all.count) + 1,
            title:     "[circle##{offer.circle_id}]分散型SNSの開発担当者募集中！",
            content:   content,
            status:    index % JobOffer.statuses.size
          }

          offer.save!
          puts "joboffer ##{offer.id} inserted."
        end
      rescue => e
        puts e.message
        puts e.backtrace.join("\n")
      end
      puts 'finished!'
    end
  end
end
