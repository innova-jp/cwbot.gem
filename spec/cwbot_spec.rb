require File.expand_path(File.join('.', 'spec_helper'), File.dirname(__FILE__))
require 'cwbot'
require 'pp'
require 'json'

MYKEY = "yourkey"
MYCHAT = "yourchat"

describe Cwbot, "this is chatwork api wrapper" do
  it "should be version 0.0.1" do
    Cwbot::VERSION.should eql("0.0.1")
  end

  it "initialize with key" do
    expect{Cwbot::Cwbot.new("KKKKKKKKK")}.to raise_error(Cwbot::CwbotException)
    expect{Cwbot::Cwbot.new("0b5217da7ceb807")}.not_to raise_error
  end

  it "post message to a room" do
    bot = Cwbot::Cwbot.new(MYKEY)
    expect{bot.post_message(MYCHAT)}.not_to raise_error
  end

  it "get my rooms" do
    bot = Cwbot::Cwbot.new(MYKEY)
    expect{bot.get_rooms}.not_to raise_error
    h = JSON.parse(bot.get_rooms.body)
    pp h
    expect(h).to be_an_instance_of(Array)
  end
end
