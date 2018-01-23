require 'prawn'

class Pdf
  WINNERS = 3

  def initialize(json)
    @json = json.first(WINNERS)
  end

  def create!
    @json.each.with_index(1) do |obj, i|
      Prawn::Document.generate("./output/diploma-#{i}.pdf") do
        text "Diploma to #{obj['login']} for #{i} place!"
        text "With #{obj['contributions']} contributions!"
      end
    end
  end
end
