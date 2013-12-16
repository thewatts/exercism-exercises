var Anagram = function(word) {
  this.word = word;
};

Anagram.prototype.match = function(candidates) {
  var self = this;
  var matches = [];
  function sort(word) {
    return word.toLowerCase().split('').sort().join('');
  }
  function duplicate(candidate, word) {
    return candidate.toLowerCase() === word.toLowerCase();
  }
  candidates.forEach(function(candidate, index, candidates) {
    if ( sort(candidate) === sort(self.word) && !duplicate(candidate, self.word)){
      matches.push(candidate);
    }
  });
  return matches;
};

module.exports = Anagram;
