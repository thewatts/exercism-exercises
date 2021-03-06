"use strict";

var Words = function (words) {
        this.words  = words.match(/\w+/g);
        this.counts = {};
        this.count  = this.count();
    };

Words.prototype.count = function () {
    var self = this;
    this.words.forEach(function (word) {
        self.addWordToCount(self.cleanWord(word));
    });
    return this.counts;
};

Words.prototype.addWordToCount = function (word) {
    if (word && this.counts[word]) {
        this.counts[word] += 1;
    } else if (word) {
        this.counts[word] = 1;
    }
};

Words.prototype.cleanWord = function (word) {
    return word.toLowerCase().match(/\w+/);
};

module.exports = Words;
