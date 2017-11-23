class Transfer

  attr_accessor :status, :sender, :receiver, :amount, :counter

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
    @counter = 0
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.counter !>= 1
      sender.balance = sender.balance - self.amount
      receiver.balance = receiver.balance + self.amount
      self.status = "complete"
      self.counter += 1
    end
  end
end
