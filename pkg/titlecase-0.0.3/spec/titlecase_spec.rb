require File.dirname(__FILE__) + '/spec_helper.rb'

describe TitleCase do

  it "should have a list of small words in regex form" do
    TitleCase.small_words_re.should == "a|an|and|as|at|but|by|en|for|if|in|of|on|or|the|to|v[.]?|via|vs[.]?"
  end

  describe "versus" do
    it "should not uppercase v " do
      "this v that".titlecase.should == "This v That"
    end

    it "should not uppercase vs " do
      "this vs that".titlecase.should == "This vs That"
    end

    it "should not uppercase v. " do
      "this v. that".titlecase.should == "This v. That"
    end

    it "should not uppercase vs. " do
      "this vs. that".titlecase.should == "This vs. That"
    end
  end

  it "should uppercase q&a to Q&A" do
    "My q&a With Steve Jobs".titlecase.should == "My Q&A With Steve Jobs"
  end

  it "should preserve uppercase Q&A" do
    "My Q&A With Steve Jobs".titlecase.should == "My Q&A With Steve Jobs"
  end

  it "should captizalize the first word after a colon" do
    "Starting Sub-Phrase With a Small Word: a Trick, Perhaps?".titlecase.should == "Starting Sub-Phrase With a Small Word: A Trick, Perhaps?"      
  end

  it "should capitalize the first word in quotes" do
    "Steve Jobs: 'so that's What Happens In Technology'".titlecase.should == "Steve Jobs: 'So That's What Happens in Technology'"
  end
    
  it "should capitalize small words which start a title" do
    "by the Way".titlecase.should == "By the Way"
  end

  it "should special case AT&T" do
    "What Is AT&T's Problem?".titlecase.should == "What Is AT&T's Problem?"
    "Apple Deal With AT&T Falls Through".titlecase.should == "Apple Deal With AT&T Falls Through"
  end
    
  it "should preserve acronym captialization" do
    "The SEC's Apple Probe: What You Need to Know".titlecase.should == "The SEC's Apple Probe: What You Need to Know"    
  end

  it "should preserve intercased capitalizations" do
    "iTunes".titlecase.should == "iTunes"
  end

  it "should lowercase 'apostraphe-s'" do
    "Kitten'S kits.".titlecase.should == "Kitten's Kits."
    "Kitten’S kits".titlecase.should == "Kitten’s Kits"
    "SEC'S".titlecase.should == "SEC's"
    "SEC’S".titlecase.should == "SEC’s"
  end

  it "should capitalize small words at the end of a title" do
    "Small word at end is nothing to be afraid of".titlecase.should == "Small Word at End Is Nothing to Be Afraid Of"
  end

  it "should capitalize small workds at the end of a title, irrespective of punctuation" do
    "Nothing to Be Afraid of?".titlecase.should == "Nothing to Be Afraid Of?"
    "Nothing to Be Afraid of.".titlecase.should == "Nothing to Be Afraid Of."
    "Nothing to Be Afraid of!".titlecase.should == "Nothing to Be Afraid Of!"
  end
  
  it "should not capitlize words embedded in parens inside a word" do
    pending{"2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'".titlecase.should == "2lmc Spool: 'Gruber on OmniFocus and Vapo(u)rware'"}
  end
  
end