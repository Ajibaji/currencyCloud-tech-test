require_relative 'authentication'
require_relative 'recipients'
require_relative 'payments'

system "clear"

while true do
    puts "===============================\n\n"
    puts "1 - list recipients"
    puts "2 - add recipient"
    puts "3 - list payments"
    puts "4 - new payment"
    puts "5 - check last payment\n\n"
    print "Enter selection (0 to exit): "
    
    selection = gets.chomp.to_i

    if selection == 1
        system "clear"
        Recipients.listRecipients
        puts "\n\n\n\n"
    elsif selection == 2
        system "clear"
        Recipients.inputNewRecipient
    elsif selection == 3
        system "clear"
        Payments.listPayments
    elsif selection == 4
        system "clear"
        Recipients.selectRecipient
    elsif selection == 5
        system "clear"
        Payments.checkPaymentStatus
    elsif selection == 0
        break
    end

end