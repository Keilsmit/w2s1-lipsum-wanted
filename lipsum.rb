#!/usr/bin/env ruby

require 'erb'

lipsum_wanted = ARGV[0].to_s.downcase
number_paragraph = ARGV[1].to_i
  if number_paragraph < 1
    number_paragraph = 1
  end


samuel_Ipsum ="<p>Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends</p>"

hipster_Ipsum = "<p>Whatever biodiesel single-origin coffee edison bulb, gluten-free dreamcatcher unicorn everyday carry craft beer chillwave lyft tousled trust fund. Venmo synth aesthetic tousled. Paleo unicorn plaid kale chips, af photo booth hoodie fingerstache cold-pressed chicharrones tumeric bicycle rights pitchfork raw denim. Microdosing gastropub blog woke, activated charcoal mixtape gentrify banh mi drinking vinegar skateboard green juice. 3 wolf moon seitan wolf jean shorts cornhole. Heirloom marfa hammock, whatever four dollar toast forage hashtag migas mixtape microdosing neutra. Listicle lomo ramps brooklyn deep v.</p>"

classic_Ipsum = "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisl nunc, condimentum facilisis sodales non, vehicula vitae elit. Nam sit amet ullamcorper sapien. Proin tristique, nisl quis dictum interdum, augue ex tincidunt massa, quis feugiat eros mauris sit amet nunc. Aliquam et magna at dolor pulvinar viverra. Integer porta ut orci et feugiat. Suspendisse suscipit eget risus vitae congue. Maecenas cursus ut diam id luctus. Proin elementum suscipit rutrum. Proin at ante euismod, suscipit elit at, vulputate velit. Pellentesque molestie sit amet neque at egestas. Mauris consequat sem ut nisl pellentesque, eget mattis leo dictum. Sed nec tincidunt est. Sed sodales libero purus, a molestie risus lacinia quis.</p>"



if lipsum_wanted == "samuel"
  output = samuel_Ipsum * number_paragraph
elsif lipsum_wanted == "hipsum"
  output = hipster_Ipsum * number_paragraph
elsif lipsum_wanted == "classic"
  output = classic_Ipsum * number_paragraph
else
  puts "I don't know what you want. Please choose: samuel, hipsum, classic"
end






puts output.inspect
IO.popen("pbcopy", "w"){|pipe| pipe.puts output}


new_file = File.open("./#{lipsum_wanted}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
