require 'csv'
h = CSV.read('hyaku_h.csv')

d = Hash[*[
    'がぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽ'.chars,
    'かきくけこさしすせそたちつてとはひふへほはひふへほ'.chars
].transpose.flatten]
hh = h.join.gsub(Regexp.new(d.keys.join('|')),d)

a = Hash.new(0)
hh.each_char{|c|a[c]+=1}

p a.sort{|(k1, v1), (k2, v2)| v2 <=> v1 }
p a.values.reduce(:+)
