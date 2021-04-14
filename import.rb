require "csv"
require 'pry'
result = CSV.read('sample5.csv', headers: true).map(&:to_hash)
@book_array = []
result.each do |one|
  arr = []
  book1 = one['本①のタイトル']
  book2 = one['本②のタイトル']
  book3 = one['本③のタイトル']
  def book_add(a,b,c)
    @book_array.push(a,b,c)
  end
  if !book1.nil? && !@book_array.include?(book1)
    arr.push(one['名前'].concat(':'),book1,one['本①の著者名'],one['本①の出版年'])
    book_add(book1,book2,book3)
    puts arr.join('　')
  elsif !book2.nil? && !@book_array.include?(book2)
    arr.push(one['名前'].concat(':'),book2,one['本②の著者名'],one['本②の出版年'])
    book_add(book1,book2,book3)
    puts arr.join('　')
  elsif !book3.nil? || !@book_array.include?(book3)
    arr.push(one['名前'].concat(':'),book3,one['本③の著者名'],one['本③の出版年'])
    book_add(book1,book2,book3)
    puts arr.join('　')
  else
    p "本が存在しません"
  end
end
