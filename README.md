# Mixtape Club

# Plots and schemas

## User

has_many auth strategies: password+2FA, apple, google
has_many links
has_many mixtapes

- username required, unique
- display_name optional
- bio

## URL

belongs_to user

- content required
- name required

## Mixtape

belongs_to user
has_many entries

- title required
- subtitle optional
- slug:  required/computed (slugged name), or custom
- #name: "title : subtitle"
- image optional
- description optional, markdown
- privacy_status: [public:default, secret (like gist, obscucated URL)]
- publication_status: [draft:default, published]
- published_at required/computed (now or future)
- license (of curation and original additions, not of embedded content) [CC0, CC-BY, etc]

## Entry

belongs_to mixtape
belongs_to primary_font
belongs_to secondary_font
belongs_to tertiary_font
belongs_to primary_colorway
belongs_to secondary_colorway
belongs_to tertiary_colorway

- entry_type (that new PostType.type replacement polymorphic thing)
- title optional
- subtitle optional
- position required/computed (track number, order in mixtape)
- description optional, markdown
- #content required/computed
- content_url
- content_type? aka which template to render, so the URL doesn't have to be parsed and computed everytime
- attribution_creator
- attribution_url
- attribution_via

## Embeddable sites/types

### Video

file MP4/etc
youtube
vimeo
dailymotion
tiktok
instagram

### Audio

file MP3/etc
soundcloud
spotify
apple music/itunes

### Image

file jpeg/png/gif/etc
instagram

### Text

mastodon
bluesky
threads
twitter?

### Link

webpage card meta/title tags
url raw
