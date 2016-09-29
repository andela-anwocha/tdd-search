20.times do |n|
    Book.create(title: "Book#{n}", description: "This is a book")    
end
