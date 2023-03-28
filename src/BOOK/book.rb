require_relative '../item'

class Book < Item
   attr_accessor :publisher, :page_count 

    def initialize(publisher, title, page_count, publish_date, price)
        super(publish_date, title, price)
        @publisher = publisher
        @page_count = page_count
    end
end