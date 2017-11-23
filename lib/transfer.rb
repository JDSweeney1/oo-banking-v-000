class Transfer

  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !sender.valid?
      "Transaction rejectd. Please chekc you account balance."
      self.status = "rejected"
    end
    if self.status == "pending"
      sender.balance = sender.balance - self.amount
      receiver.balance = receiver.balance + self.amount
      self.status
    end
  end
end
