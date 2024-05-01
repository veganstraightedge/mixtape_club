shane = User.create!(
  username:              'veganstraightedge',
  name:                  'Shane Becker',
  pronouns:              'he/him/his',
  bio:                   '44 SD/LA. AuDHD, aphantasia. I made _this_ website. 🖤',
  location:              'Currently: Southern California',
  email:                 'veganstraightedge@gmail.com',
  password:              '123456789012345678901234567890',
  password_confirmation: '123456789012345678901234567890'
)

shane.mixtapes.create!(
  title:       'The very first one',
  subtitle:    'This story like all stories is about Spiderman',
  description: 'Because _that_ line of the first Tobey Maguire Spiderman movie'
)
