var Bob = function() {};
var Message = function(input) {
  this.input = input;
};

Bob.prototype.hey = function (phrase) {

  var message = new Message(phrase);

  if (message.isSilence()) {
    return "Fine. Be that way!";
  } else if (message.isShouting()) {
    return "Woah, chill out!";
  } else if (message.isQuestion()) {
    return "Sure.";
  } else {
    return "Whatever.";
  }

};

Message.prototype.isSilence = function() {
  return this.input.trim() === "";
}

Message.prototype.isShouting = function() {
  return this.input.toUpperCase() === this.input;
}

Message.prototype.isQuestion = function() {
  return this.input.slice(-1) === "?";
}


module.exports = Bob;
