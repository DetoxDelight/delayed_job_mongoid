# encoding: utf-8
require 'mongo'
require 'mongoid'
require 'delayed_job'
require 'delayed/serialization/mongoid'
require 'delayed/backend/mongoid'

Delayed::Worker.backend = :mongoid
