var Beer = {
  sing: function(from, to) {
    
  },
  verse: function(num) {
    return this.verseCreator(num);
  },
  verses: {
    "0": {
      "plural": "bottles",
      "singular": "Go to the store and buy some more,",
      "remaining": "99",
    },
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
    if (num === 0) {
      song += "No more " + this.verses["regular"].plural + " of beer on the wall, ";
      song += "no more " + this.verses["regular"].plural + " of beer.\n";
      song += this.verses["0"].singular + " ";
      song += this.verses["0"].remaining + " bottles of beer on the wall.\n";
    }
    if (num === 1) {
      song += num + " " + this.verses["1"].plural + " of beer on the wall, ";
      song += num + " " + this.verses["1"].plural + " of beer.\n";
      song += "Take " + this.verses["1"].singular + " down";
      song += " and pass it around, ";
      song += this.verses["1"].remaining + " bottles of beer on the wall.\n";
    }
    if (num > 1) {
      song += num + " " + this.verses["regular"].plural + " of beer on the wall, ";
      song += num + " " + this.verses["regular"].plural + " of beer.\n";
      song += "Take " + this.verses["regular"].singular + " down";
      song += " and pass it around, ";
      song += num - 1 + " bottles of beer on the wall.\n";
    }

    return song;
  }
};

module.exports = Beer;
