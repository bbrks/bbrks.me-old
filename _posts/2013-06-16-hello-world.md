---
layout: post
title:  "Hello World!"
date:   2013-06-16 14:11:38
categories: industrial_year
---

### I couldn't really get a more cliché first blog post title really, but oh well...

Currently this site is just a static HTML site, along with some js to do syntax
highlighting. I'll eventually look into getting it generated using Jekyll or
something. The site was designed completely in the browser, first focusing on
the typography and basic structure, and then adding responsive features, which
can be seen when the browser window shrinks.

The purpose of this blog is to be able to have somewhere to write down my
thoughts and experiences throughout my industrial year as a Web Developer in
Shrewsbury. I hope it can serve as a valuable resource to look back on and be
a platform to throw ideas out there.

This is what the syntax highlighting looks like, if you're curious. It's
showing a snippet of Java I wrote last year regarding [Word Ladders](http://en.wikipedia.org/wiki/Word_ladder).

{% highlight java %}
/**
 * Reads in a number of 'us*.dict' files and creates the appropriate data
 * structure
 *
 * @param directory The directory which contains 'us*.dict' files
 * @param noOfFiles The number of files to read in
 */
public void readWordLists(String directory, int noOfFiles) {
    System.out.print("Loading words: ");
    htArray = new ArrayList<Hashtable<String, ArrayList<String>>>();
    for (int i=1; i<=noOfFiles; i++) {
        Hashtable<String, ArrayList<String>> tempHashtable = new Hashtable<String, ArrayList<String>>();
        ArrayList<String> dictArray = readDictionary(directory, i);
        for (String word : dictArray) {
            ArrayList<String> wordArray = new ArrayList<String>();
            for (int j=0;j<dictArray.size();j++) {
                if (isSimilar(word.toString(), dictArray.get(j).toString())) {
                    wordArray.add(dictArray.get(j).toString());
                }
            }
            tempHashtable.put(word, wordArray);
        }
        htArray.add(tempHashtable);
        System.out.print(i+".. ");
    }
    System.out.print("\n");
}
{% endhighlight %}
