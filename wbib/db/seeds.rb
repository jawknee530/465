# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#


topics = Topic.create(
  [
    { title: 'Football', description: 'The best sport'},
    { title: 'ThinkPads', description: 'THe best laptop'}
  ]
)

references = Reference.create(
  [
    { URL: 'http://espn.go.com/nfl/', time: '2015-10-25T13:47:22Z', topic_id: topics[0].id},
    { URL: 'http://www.cnet.com/topics/laptops/products/lenovo/' , time: '2015-10-25T13:47:22Z', topic_id: topics[1].id} 
  ]
)
