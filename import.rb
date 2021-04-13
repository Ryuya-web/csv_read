require "csv"
require 'pry'
result = CSV.read('sample5.csv', headers: true).map(&:to_hash)
book_array = []
result.each do |one|
  arr = []
  book1 = one['本①のタイトル']
  book2 = one['本②のタイトル']
  book3 = one['本③のタイトル']
  if !book1.nil? && !book_array.include?(one['本①のタイトル'])
	  arr.push(one['名前'].concat(':'),one['本①のタイトル'],one['本①の著者名'],one['本①の出版年'])
    book_array.push(one['本①のタイトル'],one['本②のタイトル'],one['本③のタイトル'])
    puts arr.join('　')
  elsif !book2.nil? && !book_array.include?(one['本②のタイトル'])
    arr.push(one['名前'].concat(':'),one['本②のタイトル'],one['本②の著者名'],one['本②の出版年'])
    book_array.push(one['本①のタイトル'],one['本②のタイトル'],one['本③のタイトル'])
    puts arr.join('　')
  elsif !book3.nil? || !book_array.include?(one['本③のタイトル'])
    arr.push(one['名前'].concat(':'),one['本③のタイトル'],one['本③の著者名'],one['本③の出版年'])
    book_array.push(one['本①のタイトル'],one['本②のタイトル'],one['本③のタイトル'])
    puts arr.join('　')
  else
    p "本が存在しません"
  end
end
