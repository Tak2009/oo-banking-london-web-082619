class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader :balance

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @amount = 50
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > 0 && self.status == "pending" 
        sender.balance -= amount
        receiver.balance += amount
        self.status = "complete" 
    else 
      "Transaction rejected. Please check your account balance."
      self.status = "rejected"
        
    end



  end

end
