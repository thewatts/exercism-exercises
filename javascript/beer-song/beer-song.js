var Beer = {
  verse: function(num) {
    return this.verseCreator(num);
  },
  verses: {
    "1": {
      "plural": "bottle",
      "singular": "it",
      "remaining": "no more",
    },
    "regular": {
      "plural": "bottles",
      "singular": "one"
    }
  },
  verseCreator: function(num) {
    var song = "";
    if (num === 1) {
      song += num + " " + this.verses["1"].plural + " of beer on the wall, ";
      song += num + " " + this.verses["1"].plural + " of beer.\n";
      song += "Take " + this.verses["1"].singular + " down";
      song += " and pass it around, ";
      song += this.verses["1"].remaining + " bottles of beer on the wall.\n";
    }
    return song;
  }
};

module.exports = Beer;
