#Abuelita sorda 
def deaf_grandma
  puts "Qué quieres decirme nieto, recuerda que no escucho bien?"
  r = 0
  
  def isu?(str) #Método para identificar si todas son mayúsculas
    c = 0
    str.split("").each{|letter| c += 1 if ("a".."z").include?(letter)}
    [c == 0, c]  
  end
  
  while r < 3
  conv = gets.chomp
  puts (isu?(conv)[0])? "NO, NO DESDE 1983" : "HUH?! NO TE ESCUCHO, HIJO!" 
  r += 1 if conv == "BYE TQM"  
  end
end

deaf_grandma